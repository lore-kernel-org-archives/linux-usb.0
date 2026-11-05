Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872310;
	b=0R35C7dtKhu37cXA0llfo0G0yehO1wCzhchxyELNZrSih4tPp/6BxCVa8LxC6ZblLdRH
	 NfrCp1wgCFlkPGQhLusQq1LyHuhKlyAXM0JWFR+J80GfK3vSNvqSxNw1VimE0SBssNrRs
	 JQEcKCexkuK7k5/eDZFcYsfNT5ORQB65aKrs7N1s81MYBiLLLKlTQfAQ6gowbn8mH7vPf
	 ovJPN14kHlfvWjsTtSjIg67rwsgnRe7+lYfe9fCGGGr8pxAwWhCZRim7KFbLQwmenRYrm
	 NEd6PkOfGQYUV9tS1/5pSAwkVC6FUEMD3imgVP9ZNVVWUdLCpcQMYju5zeDTVJSeRdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872310;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=SqrTjgENN7Dfs+HehxbKPgACeb32UvvfMAFijNHd6N4=;
	b=vVdpYHpe15w+1cCxINhpjMBbqvZmhbANoKvs1LWkO3vVYcUchM+vFIY0l2M71X7I/JIF
	 rBWd//pDijBuul6dWmWqsDXaUaNjvYE6eUV0X7rAjTbNMHzEkQuIqLHGrz+09pAf5SIUQ
	 cYQLVJTxgaoXhmnrRxrHBzZZtnnir0N1isQrLw9pAWY44g6YBBRqbUP1m2uOrnX0CYrCf
	 lEQF0g9SYIzypOJy+AI30uZaXCNhIvylFfmstWMGVgxnHuOe4VEzKoueNkDkUScH8CvZZ
	 yCf0YM5XNftxXDaL5vUDmV1xW5HNYl0lUScIcEGbzznqPLcSt5edevMmroqcpjDK8iA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.182
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DA6606A329
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 09:51:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7DA6606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-93e635220b4so159047485a.1
        for <linux-usb@vger.kernel.org>; Thu, 05 Nov 2026 01:51:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793872309; x=1794477109;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SqrTjgENN7Dfs+HehxbKPgACeb32UvvfMAFijNHd6N4=;
        b=SBZtiTY+j1VUxutNgvZFPSlAcYgJpwEWJ9vM0RCH1nfMgQsIXi71b6T4FwinGAgoeY
         xm+4y5I1qILI2V4fie1rTriitlekTD2aFGZ9AO7ZBZ4ruoK9+KDrBsFqjNf/qyK+kSOb
         7evTH3Z4XrSaNsxWOsGxI9TEmiMJkpktY2NQMXDJvWu4lvIwfFKngJEqJQdtR+R62lnZ
         RAus4xEsP3MLNfdteFELqADoDygBYQbDV6Fb8Dc7EbFlEbJG7tZzzblOpaI5PU4A0DjU
         84LbEcS0k5e1Zc53iRz1WA9F6ZReKgtgB2QnbPRKeKy0CmPBT/tzFrUZH7kqGG7eQRHI
         asLw==
X-Forwarded-Encrypted: i=1; AKwUvBxCUtiFxWa2iqrnNWgfSh40Ri+Zbu8qU/8xw0eMroaOAlcqaLji7aNd7kfCTzGQsLXzRC7vq5gzppE=@vger.kernel.org
X-Gm-Message-State: APuU4Z96i6VUKB+BSBG6K+55E04GsZaCZGdJfkLBG5mM+MlSW8lM/MO0
	VPDRBcWryN4Jb5o6DrMolXGZ5JAVALjEAFIkWDfW0C5nh8QmP13+7KPUJLXccTyT9Mo=
X-Gm-Gg: AYBFou3cSaKNsPTX+bE9qUOSewc8dEy5wDkEBMckhoy/mXFMRwf3WmHSFMd2tx5eeH4
	ClQoLRI9V+NgI8g3rUfsuNH4ni+ur/U1ZzQfv3q3D5nIOtCOBF2qfvVUCFz6UekXHlSGsTOvj/E
	pXdobfTBjQJw0fDdrlcHfUhWlWBgMexZtI1ZicRYHoSO3CVpGBsd1hGAAliNGMvuzUlN/fV+cG/
	r3oxlUcKh2jeML9wpEEO1GVB84q2z6QgyFEB/IZKAJtXAfhoHSunGQi3Ipjsi8uNMwvNqUgPowv
	gScKkOJOmIjsCB9nJaDVkxfsHNAz4tqXXCtMH8dJHwB0pd+ccNpyaAbolTK3n4pJ8iAWIQYiSIR
	WGYE8jyEQ9QAqccD6wxeeLf88CAGVHOYRORKHO7kSov0bCzzpyjqpHPj4VrZhd1kX5geTB0UXFg
	wDqacgJOA64cvu5Hu1372uJrO3c1+wTTxMpdvn4F1zNplwbRiKDYNIxAOpcgKly0/kBUS64+ud1
	vx9vXLIIsxuw/P4iXNKN0ElHgjAGvih125yiIrL1G92VZRyCeIjvLOG87lgvOg5Dao7LIdZYeAH
	l42C+tFxM/gqv1oLvZp9cnn4zVGaTmytPj2VJQyQJBNQl3L3D2BlJ4NXuVy7EVJhdtohRw==
X-Received: by 2002:a05:620a:404c:b0:93b:d7a1:ba16 with SMTP id af79cd13be357-94421725362mr3178415785a.65.1793872308754;
        Thu, 05 Nov 2026 01:51:48 -0800 (PST)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com. [209.85.160.177])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d479a1d5sm424253185a.10.2026.11.05.01.51.48
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:51:48 -0800 (PST)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-533778ab0bdso18440341cf.3
        for <linux-usb@vger.kernel.org>; Thu, 05 Nov 2026 01:51:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxsAuHrqxNo+OS5Ql04ynw0MF2V3t9oui1WE0ca9KVMYnsDTTB89QXnW0trB0Ixk19G6BbieoQQHMc=@vger.kernel.org
X-Received: by 2002:a05:6102:3ec5:b0:7cc:2bb7:131d with SMTP id
 ada2fe7eead31-7d072baa484mr7324212137.9.1793871885062; Thu, 05 Nov 2026
 01:44:45 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-work-procfs-bugfixes-v2-0-021c84d852e0@kernel.org> <20261104-work-procfs-bugfixes-v2-10-021c84d852e0@kernel.org>
In-Reply-To: <20261104-work-procfs-bugfixes-v2-10-021c84d852e0@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Nov 2026 10:44:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUy1RYKG0g8OWss3AD-jyYx3DXL0K7ABYkFUdxTxZ9VdQ@mail.gmail.com>
X-Gm-Features: AclHuK9D-nB8icBns0zdoQH8fV1cfUPJ6LOey8o_VlUZpDIGqKC4cFf8-j5-HdE
Message-ID: <CAMuHMdUy1RYKG0g8OWss3AD-jyYx3DXL0K7ABYkFUdxTxZ9VdQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 10/51] zorro: size the proc files like what they serve
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

On Wed, 4 Nov 2026 at 20:18, Christian Brauner <brauner@kernel.org> wrote:
> The files under /proc/bus/zorro hand out a struct ConfigDev and seek
> within that, but their size says sizeof(struct zorro_dev). Say
> sizeof(struct ConfigDev).
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
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
