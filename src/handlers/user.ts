import prisma from "../db"

export const createNewUser = async (req, res) => {
    const user = await prisma.user.create{(
        data: {
            username: req.body.username,
            password: await hashPassword(req.body.password)
        }
    )}

    const token = createJWT(user)
    res.json({ token: token})

}


export const signin = (req, res) => {
    const user = await prisma.user.findUnique({
        where: {
            username: req.body.username
        }
    })

    const isValid = awaite comparePasswords(req.body.password, user.password){
        if(!isValid){
            res.status(401)
            res.json({message: 'Not authorized'})
            return
        }

        const token = createJWT(user){
            res.json({token})
        }
    }
}