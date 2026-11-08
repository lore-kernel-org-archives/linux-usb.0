Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794164398;
	b=vQh2EoK7jEz0hHkQyC1N1Q9chdaCmzzvKD765TOb0f9hzznxTX+TxusEA+SSqSGMTaBm
	 Nuf1NnTwZRIFZRGqMXy17aqfDbl7E0STSZyzD2fCwhxB0XM7JLdJzGjzogpKmVpfsKZTX
	 QZDWOxltjCdM59usvH82K3SNA/rCHyKFPDfKD1LkqgroX0yEIy4cbcsz5Ztr4vYseeE7O
	 rcMyrWiWBJ6TEFtuYeszKCmpRA2g4hn6wOxJa/IAKAIWxi2CIqK4jLufq6IDyBFd9m6o7
	 qNO5BXVwAXp+JkMUeQfCARgjYVQxoSZ4oeTio6fNQsUPwtXwlKeAtwg6bvlqK75BAQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794164398;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=JLhUwzup1lwefYy8NOOFjthYnrByVfTsqIe79kkV+Lk=;
	b=xSjcWRGEjqSSnp5AzMp53SuihjsKhInHktNtkLNGfCY7UjKZoZ5VrhpzZONIk9j3S9vt
	 xrsvnXeFcbm2x4WbhgctCafx3H+scP0ZTXVVtsVGnR+vgxGves6bkT7szzWIxTQ2DSPgR
	 DpiMVUB3Xa7gL7WqR4HQ7MPFmQDmCpYleMcT11bVgr+EmPbU60/RzD+MpbHndi3xyNA7K
	 USZiQ28EQIXPS8accLgg8Fspr8k3bzP7PwOw3CjcCmf1bdSwn2KCO5wZ4l5L5pI53hFnt
	 wBT3n4p5OwLaLtTK5hc5Px8CsmNsZUhktNnT0AqE1ws0ZbHY92iHtS0LlijZDx+VC1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XrEUEgHU;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D014606A33D
	for <linux-usb@vger.kernel.org>; Sun,  8 Nov 2026 18:59:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D014606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XrEUEgHU
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so1338205e9.3
        for <linux-usb@vger.kernel.org>; Sun, 08 Nov 2026 10:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794164397; x=1794769197; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JLhUwzup1lwefYy8NOOFjthYnrByVfTsqIe79kkV+Lk=;
        b=XrEUEgHUwv+lt2Z0T4RzlOQuYT1yMbnY/MJrtF5HY2pc8m0ujKE+1IGJbqc3A1SsPJ
         Pz+po0Wh7ECcrOl1hyNdZBme+OsO/r11IeCA1lW9KMbstFhlOkC0Hm7Ef+TTavGsfrDk
         7T2AE8nlcorDhYFpLo0KTCt4xOv09AacMRilfH2h4PS2mZ0iBReAF8XAcgtI3iT+qlRY
         EJQPYUIUlDRCCjadf1+24R8V0flZyhCZpLCroCVsidoQ510350k4POOaAcSXgGRrBTWF
         rbpUnz5O6K0TOR8uz/zwLHiObwDAqnCJFWP0+ssCNYCBYnXJwQ2yMfUqdKkv6ro/lp/q
         XMaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794164397; x=1794769197;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JLhUwzup1lwefYy8NOOFjthYnrByVfTsqIe79kkV+Lk=;
        b=D+2vlKhsKAtrVzjTU0MbGFc5rRufZxJFpD6US/0I2hBkA9XLR89vz9cE0nyfON5LNo
         h+qJbMyDlFlixO4KP1tX4YaytS8iaaQ6bkRjcWTC0gAPAYeFtYtjrHapMylALMijkr1A
         DHDPQdLQkBd8Cmhj8OP1boRcMvqJ2k3i3smWY8XiFsLLO4WKdm/GNGKuC/8U9y4H2f5v
         1NNdrslr3NYCkNchO0o2Rv+Y7sQ5phDkwP55kowXDhssim3S+ax7U/4sKsGEwd/Mj/zr
         kwIimRxYPPMdwp74PyUaPIHTpF/SskAtDaM1wvmiVW4ING8PiC1bEHmwC1A7emfga23A
         uJ2g==
X-Forwarded-Encrypted: i=1; AL+hErG6KYNSsiJi/aK1jk9zi/aJFEGnN8+zqq8mDzZoegLDm92BwF/+MxJp4hRhgNLnDX/em8aHr/ynh+A=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AGnP0HbVlFGHVXx1caxiHSU+/a3Xf71CWAr84yqHiHT2ghRuA
	NTlcN8TCIyYiEABJkX8zo3HPOw/4R9FDOnex8ByuvvJU4gL6euJg39QE
X-Gm-Gg: AYBFou1SlMd2qDHLmTDK93d521LkWPJ18G0CnzrTmQds+QrO3tkX+gZJftUggWT93e1
	up7Br+g//kTJL6ePNIKdQPDTmXisYpwlCTZCDOv4yA9jm5upT1MFcxeYHS6bh3mH1W7Wfd1+ntt
	qbGPdVRuBW5AsiTEmUfVtjIfIoFfgYQbMzZdfS8ILjrSKtAvgcya0wRdOJ7birPRfu9z/MeH7lP
	bL+DsCg1scwaHZ5Llff8S6kEKURnyfpHB3X54fF8/MezTM0YuFtP5FH9TExCMDxXVGdXoYOlxqB
	L6Fahd6ghxWWAJsami4fvHy2FhLbrmxrG7B5NkbcMEFNdYLkPWTE7ajXsaHFdrYnHIwNMlRpukK
	YvRAw6PVYjHV4r/oepPhI6kWJckUkd4i581tC6oO4QQ+bSnfrpZq+JCptt5vcFBut5NQeHt8KEF
	m2mShIud7iHGPXYc7ADhxtTHoEFBNJzz7TDhSOTDwUoaJE2yIBn3HRxWI5wqIVa8HFZX/7L8TJR
	6xL3b9bd7KuU1dfc8c9qbwXnTHy/Q5/JCpATI+w9Im8+JE7dCfQsvx60rZ6Sb9UJNnnifPiKqwi
	OBcsP/mMkWc1I/Jy54+QOwewtpB3WqqIu4MAkKUpAskVhfn8iwr6IEiYp24LOft2
X-Received: by 2002:a05:600c:468f:b0:4a1:7e77:c382 with SMTP id 5b1f17b1804b1-4b960d9b170mr35982125e9.5.1794164396406;
        Sun, 08 Nov 2026 10:59:56 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7efb1f3acsm185228445e9.14.2026.11.08.10.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 10:59:56 -0800 (PST)
Date: Sun, 8 Nov 2026 18:59:53 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-fsdevel@vger.kernel.org, Linus Torvalds
 <torvalds@linux-foundation.org>, Jann Horn <jannh@google.com>, Josef Bacik
 <josef@toxicpanda.com>, Chris Mason <mason@kernel.org>, Jeff Layton
 <jlayton@kernel.org>, NeilBrown <neil@brown.name>, Eric Dumazet
 <edumazet@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Al Viro
 <viro@zeniv.linux.org.uk>, Jonathan Corbet <corbet@lwn.net>, Christoph
 Hellwig <hch@lst.de>, Greg Kroah-Hartman <gregkh@suse.de>, Joel Granados
 <joel.granados@kernel.org>, Kees Cook <kees@kernel.org>, Jan Kara
 <jack@suse.cz>, Jan Kara <jack@suse.com>, linux-kernel@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-um@lists.infradead.org,
 linux-wireless@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 netdev@vger.kernel.org, ntfs3@lists.linux.dev,
 platform-driver-x86@vger.kernel.org, coreteam@netfilter.org,
 kexec@lists.infradead.org, linux-pci@vger.kernel.org,
 linux-sound@vger.kernel.org, netfilter-devel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, ibm-acpi-devel@lists.sourceforge.net,
 jfs-discussion@lists.sourceforge.net, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-cifs@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-mm@kvack.org, linux-sh@vger.kernel.org, linux-usb@vger.kernel.org,
 samba-technical@lists.samba.org, sparclinux@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-doc@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-atm-general@lists.sourceforge.net,
 Takashi Iwai <tiwai@suse.de>, linux-input@vger.kernel.org,
 linux-raid@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-debuggers@vger.kernel.org, Chuck Lever
 <cel@kernel.org>
Subject: Re: [PATCH RESEND v2 14/23] proc: let procfs copy in writes before
 pinning the entry
Message-ID: <20261108185953.28054fb3@pumpkin>
In-Reply-To: <20261107-akteur-gemieden-eckdaten-21304d085e35@brauner>
References: <20261104-work-procfs-core-v2-14-76ace653a773@kernel.org>
	<CAMuHMdVfakapgBK6TBhO1iWX8qzvLDk8jzRS=t2MVa5G=MCUeg@mail.gmail.com>
	<20261107-akteur-gemieden-eckdaten-21304d085e35@brauner>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 7 Nov 2026 10:48:35 +0100
Christian Brauner <brauner@kernel.org> wrote:

> > While at it, I think it would be good to use this conversion as an
> > opportunity to replace "char *" by "void *", which will probably let
> > you drop several casts from users.  
> 
> So I tried that too. The thing is it drops exactly one u8 * cast in
> ntfs3's label write. 

Since char is now unsigned that one isn't even needed...

David
