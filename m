Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872838;
	b=fcCBvXboCtCCrgHeyLH7vDrZswPIeWw0nl+v9dZVI2HxfmQIiD3GbhBw2n0uYlsFR1YG
	 D6tbQUiCoyAggMe9z/V+FajsfmjbXok15G14exrFFkXbNKp6tLUEl/fl4+H55evy5LGbK
	 8z0R1rPWJRM7grYe04KBj/JaXibIEe7sEEfRUbAyqeDQSgfqLOsHlKrJCkstmR2+/25mH
	 wHeJws8i5BcUe3wJwdL2cGdBb5Jl72xM+7jDyuOlrexwIO8yQ72MzaRqnb11olClVN+Go
	 t7ZOheNzaMR8C7EDgRXTqmQ3QWvEybY4meDDkIfenrD2FmWbxkw/MpJm29fEPjSThTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872838;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=n+1lmuZTLENNkpqKh8T8PUriZ63OKZ7RGcjsYNzzAGM=;
	b=bbj9Nd3zOZytjCcEDz5CCxAEcoyCTmkB7eXYkUO2Pc+CpQ4RlmZOqJfoxGG0OxHB0RrV
	 tQzMz0ZCKXT5g1yiVXnJgvlKVXi6OmfVqPWoUTe4yH6PUccfNc4ruuqriCNz8dGEtsP9s
	 ubK61bxsdlWuWPhYWpVVKH7W9l7DHXJHEoP9n93ZlxjHfH3nWK0uO4qxBwTkyIiDGOjAb
	 omm20WRVi0QsglCwg4Qkyczi4Us0JxuCRVGytgncWe4gBjbEgz7q/0+NZH056GakBirrP
	 I3athFALZCnu9u4M2xC1z5vznZpg08LO+iF/RNBY/k+S4ppfYZHLDAyexX0hSGGB0Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B1D606A326
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 10:00:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39B1D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-5365f9a04c5so23567471cf.1
        for <linux-usb@vger.kernel.org>; Thu, 05 Nov 2026 02:00:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793872837; x=1794477637;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n+1lmuZTLENNkpqKh8T8PUriZ63OKZ7RGcjsYNzzAGM=;
        b=OebXnzLYZ6C1wJG4uUHZEpiFNykuSDuZOXgB+al2fgAnnqep5Tz+xZH/Mm/gHdTTdP
         nph9GsUrj4aOyuBRTZRArGMkRs6NlxzmPleVOpckSdO1dDoDLyfwGQPGeyHX8XOZ53vr
         9PyvsR7+D055dVpOqommyVwf4lMxf6V47QjPRo28PW1CbJXIlviEJScUDmU2uyDp1GZt
         Db+9ygu28qYa0zdU+90LGisvNFc5lwABmbTZDfZ5GbJ+BbHmDJ72LmwoFLffXzjrP0f8
         29HH2Uiv1N+d4BmIqxA9rb8vN1CyIcHYCkA6dczwhaRyg2es0S64iWLPYxG6B1jOcOQr
         2lMw==
X-Forwarded-Encrypted: i=1; AKwUvBwl6VpUEDJPVm4UDAWHy4zhsNFT0Kww9vWWnNGdmzOfMlScJxIPkxus8Y9JoBhbeu8o3i9sB5/SI7k=@vger.kernel.org
X-Gm-Message-State: APuU4Z87DKuSF5NdxscPNO3/TWm6HZei5IV4vIUY3uApQ/4J/gvX928J
	UB93PLjqav0Bsxj3zDBf3KwZz0yKm+Yg2LaheI3VXRHufZ5UzA0vEBaDuDgUmEqyWqQ=
X-Gm-Gg: AYBFou2u6Fb0SttVuz35w0M5LCHKKnSu2fSpgcRiim4lLJtOnZG1OFsNKMfx8i/Yxe8
	6DMWR3QIZ2yF8sblYVqsMpQjCIdEsO1fmP3cutSMl1o2PnN/tAlhX26EUPNTh5fHlt/jZuGeCFw
	A8xd/ZlKe6m29I54CUEgU4N3fJzW1AbCkSjSXy7EARb1kFzQUiVYuPujDeeToD8ieoVaXjbLXel
	9AT8rVcUG2LJRW2GswncQ9iKrVEfknnu/L0q7sCtbcrkbvG2KONRG1rFnNkdIZHvV1jDQ+Pitkc
	dtQ+TgANTd07B5m6D4FIx1+66bPboOhjpQ27Gl/chu/pcnpM539m0vvsPz7L6bVfk9Mhzus8eZJ
	34m8ivRXZOBTpHFNgXMb0w1NmU2DAxHVR1zJjY0ELN1oDf+TkOrPySFOvSLrLb1GieRjy+YMwjs
	G8tETBju8Xd4HBsSJAeGvvuYHB7sHoYA41TOFLpiX3RfXpwv2gYQppqft0k48546/kQm8KcxQh0
	ENy4UpE2VpQal69WNwiGChgy0ySrBrZaEG2teP34X8kSsK9O7dj++AAhwVi094oIXYM/U7udvdY
	BvbsJttaHmN8h5iq1g2t7LixyWdoKoVIC99FI0Ia0io6yhqLO7gdFCbctnqw1AIevw==
X-Received: by 2002:a05:622a:5d0:b0:536:6abc:54b1 with SMTP id d75a77b69052e-542b6a6c6ccmr331482381cf.28.1793872836914;
        Thu, 05 Nov 2026 02:00:36 -0800 (PST)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com. [209.85.219.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54b1086db63sm47778911cf.11.2026.11.05.02.00.36
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 02:00:36 -0800 (PST)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-91c7a0c1617so23362826d6.0
        for <linux-usb@vger.kernel.org>; Thu, 05 Nov 2026 02:00:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByaCUrQSTdxgbFHlLbjDbaWTFxX1nv6E4iLAZyfQIE6HqfJxV4MWc3tN/f+sHvsGJJ3n0FO196k9iE=@vger.kernel.org
X-Received: by 2002:a05:6102:6449:b0:7cb:bc5e:7dad with SMTP id
 ada2fe7eead31-7d072baa450mr7614890137.10.1793872492413; Thu, 05 Nov 2026
 01:54:52 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-work-procfs-arch-v2-0-2aeb952c9597@kernel.org> <20261104-work-procfs-arch-v2-4-2aeb952c9597@kernel.org>
In-Reply-To: <20261104-work-procfs-arch-v2-4-2aeb952c9597@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Nov 2026 10:54:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUNBs_NyhFpXonirMXkYptUWsAizMvVpGHUDLzto1LGJg@mail.gmail.com>
X-Gm-Features: AclHuK_RsrcE7hVRjmpZezBV5tMd490Mza2XAQiqUTgUNqAiHAzRP5z7NIbtMh8
Message-ID: <CAMuHMdUNBs_NyhFpXonirMXkYptUWsAizMvVpGHUDLzto1LGJg@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 04/23] m68k/bootinfo: let procfs copy out reads
 of /proc/bootinfo
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, Jann Horn <jannh@google.com>, 
	Josef Bacik <josef@toxicpanda.com>, Chris Mason <mason@kernel.org>, 
	Jeff Layton <jlayton@kernel.org>, NeilBrown <neil@brown.name>, Eric Dumazet <edumazet@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Jonathan Corbet <corbet@lwn.net>, Christoph Hellwig <hch@lst.de>, Greg Kroah-Hartman <gregkh@suse.de>, 
	Joel Granados <joel.granados@kernel.org>, Kees Cook <kees@kernel.org>, Jan Kara <jack@suse.cz>, 
	Jan Kara <jack@suse.com>, linux-kernel@vger.kernel.org, linux-nfs@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-wireless@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org, ntfs3@lists.linux.dev, 
	platform-driver-x86@vger.kernel.org, coreteam@netfilter.org, 
	kexec@lists.infradead.org, linux-pci@vger.kernel.org, 
	linux-sound@vger.kernel.org, netfilter-devel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, ibm-acpi-devel@lists.sourceforge.net, 
	jfs-discussion@lists.sourceforge.net, linux-alpha@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-cifs@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-mm@kvack.org, 
	linux-sh@vger.kernel.org, linux-usb@vger.kernel.org, 
	samba-technical@lists.samba.org, sparclinux@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-doc@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-atm-general@lists.sourceforge.net, 
	Takashi Iwai <tiwai@suse.de>, linux-input@vger.kernel.org, linux-raid@vger.kernel.org, 
	linux-ext4@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-debuggers@vger.kernel.org, Chuck Lever <cel@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Nov 2026 at 20:36, Christian Brauner <brauner@kernel.org> wrote:
> Implement ->proc_read_buf() so procfs copies what is read to userspace
> after it unpinned the entry.
>
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
