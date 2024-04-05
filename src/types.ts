export enum Brand {
    Tissot = "Tissot",
    Seiko = "Seiko",
    Citizen = "Citizen",
    Casio = "Casio",
    Orient = "Orient",
}

export enum Mechanism {
    Quarz = "Quarz",
    Automatic = "Automatic"
}

export interface WatchEntry {
    id: string,
    created_at: string,
    name: string,
    description: string,
    brand: Brand,
    mechanism: Mechanism,
}

// export type SummarizedWatchEntry = Pick<DiaryEntry, "id" | "name" | "created_at">;
export type SummarizedWatchEntry = Omit<WatchEntry, 'description'>;

export type NewWatchEntry = Omit<WatchEntry, 'id'>;