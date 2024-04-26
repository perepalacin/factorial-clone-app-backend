
export interface absences_data {
    id: number | undefined;
    type: string; //TODO: Turn into enum;
    start: Date;
    finish: Date;
    employee_id: number;
}
export interface TeamMemberDetails {
    name: string;
    picture: string;
}
export interface TeamMemberProps {
    teamName: string;
    members: TeamMemberDetails[];
}