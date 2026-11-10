Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794273280;
	b=0YxCfgyWNGk0/Ik4LUcvFDV37fVM6rAOaks3jVsmmzCcxAZVx3VxtXgbBvER98cZJC/n
	 /iwb5RyM2q7TeChBkJ4lqfmBOdwa9wVKX/RJ+tG3qHZ690V1n5AGzxa5/uOnwRvsXRpI4
	 0BA78JsxGgqGxubvaNE0Z4eUNNMljAsvUyAyb7WLxfVdwL21MwP5b1u4ZJixLTeEnreCj
	 2RKWAx4Cbil1jBQOXrOfBs0kmSAakZGwtrRm7EeqpVGqLE1Yb1lpqoYpUsRbCq7Kh4mdW
	 NlMU0orz0LKjhUM9Hs+ytsPYmwdkY63VHZuJ2ZxfHcs6VIDEVXUcTVU397ABrLVpnlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794273280;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=m2qXctBTC0OPADf0V2KkMb6r2GA0JgabIuFAMe6ERzQ=;
	b=D9xQ+n346dLAV35dtCdPNqyqlJSvHlm3YO8TSm4ny1p0PxK+4sCjz8b0X4QmgD4C3Zy5
	 7RmhcVHVjoGd+YBE+Lkvf/Sgvuxfn9HWDJXsTMHpI6hPVSym1VdshjEXkzbBn8+K1jGtm
	 pqHbFw9gonyBjMvydEpNQTaILanMNb7/4641cs+NaueSUnXDsbitl54i/Ou45QXOLjbji
	 pdLGZSS87N16eKfa68yZBVCsEr0/fCyFasWiKS1ni90O3HGcwqksP1EL3CtViWO6G6Ifr
	 tDI57Z+lNScWQLJMXJKN/9CAG6kvyxjtWQfvX0P5H3bIQ9OWIOPLEnL5NZcL/2h2OMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b="g1loKr/+";
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2052D606A31C
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 01:14:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2052D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=g1loKr/+
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso15171405e9.1
        for <linux-usb@vger.kernel.org>; Mon, 09 Nov 2026 17:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1794273277; x=1794878077; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m2qXctBTC0OPADf0V2KkMb6r2GA0JgabIuFAMe6ERzQ=;
        b=g1loKr/+y9x0nY+lb1QhBSXqQgRICr95vFVPzpsOCY5NDFTxA+mF16ORcD6YqR8v3m
         4eky8xRdngge0Htz9INQyBrNKHLQvbOY+yAVSOPH6FdTsuYu37+HaYoDjK9p3YtRt9g3
         bDjiTn3e+bFhdnhCAHLN4UWHcj9cz7hlfb7Zw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794273277; x=1794878077;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=m2qXctBTC0OPADf0V2KkMb6r2GA0JgabIuFAMe6ERzQ=;
        b=wFQqf68zj26Z0NCGiRKCE/fzAJp1rtB3tEFIr77QaCr65I1hR8X76Ej6ZacPu06tXo
         RImF0pOZbQMwlTB71atdkqKNC+IVmU17vX2VbkSy2yrHSd/EgOH7b0U0ObP5WlxxOeeV
         nbl4LbKI3U2h0SKcSWrxuxC3dKtDlTnam8iVOisLK9Sp8M4h7O8J0MbjD0F/v0X8rX4h
         RTw0Gzdl6927gU8bu9Atj1GRtUbDSlXBQTi7ETpQ/sv2ThDWRESdZl+SPL6IWFMV3vTV
         jd2rcW/WlaxlhlJIAE6I82N+yu2C58gBDwUAc7/4cqsr1mmqcNiue0e3poa/OYRmx5HW
         4dLQ==
X-Forwarded-Encrypted: i=1; AL+hErHHNAjLS6rRb+OtNVvXS7NsW/KImDYJpzUyw9ovkZiuSZk/+1x4Z4h8CHLn3b1vvlSd16IbiA22tgA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8AZAMiVNFQLl4DDDuVy2yCLDW0QJVp0dgRRxlWmShMahS8KjWr
	r3KYZNFZWTRC0n9iVvK0tnttlG4jpsLNDUgexqOYN64mUsHwqoDi8YU6ySvbU5F36RXBGJJR9qQ
	ZJp0xltsnGw==
X-Gm-Gg: AYBFou1oo7YIErA1Lw3IW5ixD+Uf2EzqPsMISn+xDPB+memH0c3MddPbv5uvRU0YO5C
	gN3m8CYyLF4vZrOGm4jlqWAKvZW9cR2uSF7fD3uHhzcACDNg0JP3T2Ei37pk5clwgcJG2JQ4q2q
	WmSCYqC+XpjKmYdNhZKZKeCwLGs8lltjVP4iJ39H5izFwR70lqkz84LKItMI5Hu6OgM+XVEr3gU
	NUsXdWAIpCCx6Vuk7Ql3DvbbvOVZveS4Hpw1nrG8UI2+GUApqePmkO612GT0YKcKILC/8APFE7J
	A7We5yaBxSso0+rP5qC1btJioGMKrXGEwDXXj+eIU8AqVaH4IqvLApFGe2CcUY81nG71iJbi9iD
	vlgin+KNc/1F8A8mWzMjzwnh89zdeD0kP/Q6XslBFt6S2GL+hnbzagRiM8G2mnwPcYuFCW6nQUU
	n4sBmkJyLCAPUGg/ytKEw7HaKMVu4/HCgj70vjN7KJlYjfvfFfJdC+F+b5B3CtwrtmBLfxunOal
	duD3hhIQ+G+ZrZTbLRk8vEa3Inm0rk2utzsyRNgA2VZRfV0b3RmkZ4NZO85xTJV4YCo6WzlBS0F
	Pa6T3ewUBcnbQLRslleoMuZkUkHjm6yKs/lJChYnJv7AQzM8blBYt1z4DsXCYROEgOcyFvE8hEq
	nbQ==
X-Received: by 2002:a05:600c:81c5:b0:4b6:540d:6317 with SMTP id 5b1f17b1804b1-4ba02343ae5mr13110315e9.12.1794273277502;
        Mon, 09 Nov 2026 17:14:37 -0800 (PST)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0203a76esm22354335e9.3.2026.11.09.17.14.36
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 17:14:37 -0800 (PST)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c450ab1483cso245236766b.3
        for <linux-usb@vger.kernel.org>; Mon, 09 Nov 2026 17:14:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErH5C/me83+/+jLfXty9OdYfxk1MHlWlEVzQO5U0PfCC9M7lCXcHpK4yiSaBb68zwla+BglHGnn3Hnk=@vger.kernel.org
X-Received: by 2002:a17:907:9451:b0:c41:1750:59a2 with SMTP id
 a640c23a62f3a-c50495dfbd5mr87253466b.12.1794273275844; Mon, 09 Nov 2026
 17:14:35 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-work-procfs-core-v2-14-76ace653a773@kernel.org>
 <CAMuHMdVfakapgBK6TBhO1iWX8qzvLDk8jzRS=t2MVa5G=MCUeg@mail.gmail.com>
 <20261107-akteur-gemieden-eckdaten-21304d085e35@brauner> <20261108185953.28054fb3@pumpkin>
 <alpine.DEB.2.21.2611090504170.17804@angie.orcam.me.uk> <20261109214558.0d9d5228@pumpkin>
In-Reply-To: <20261109214558.0d9d5228@pumpkin>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 9 Nov 2026 17:14:19 -0800
X-Gmail-Original-Message-ID: <CAHk-=whsA3tKcUCBJDj_vmJ11rVGT9rivgnKjGRgMO21CPmCxg@mail.gmail.com>
X-Gm-Features: AclHuK-x8jcOOQUqd2amGoGEAKER9jIFGaeL4LxxWAd0cGV7dz_RR64PtDogpPU
Message-ID: <CAHk-=whsA3tKcUCBJDj_vmJ11rVGT9rivgnKjGRgMO21CPmCxg@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 14/23] proc: let procfs copy in writes before
 pinning the entry
To: David Laight <david.laight.linux@gmail.com>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, Christian Brauner <brauner@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, linux-fsdevel@vger.kernel.org, 
	Jann Horn <jannh@google.com>, Josef Bacik <josef@toxicpanda.com>, Chris Mason <mason@kernel.org>, 
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

On Mon, 9 Nov 2026 at 13:46, David Laight <david.laight.linux@gmail.com> wrote:
>
> Just that the cast would have to be:
>         u8 *foo = (u8 *)bar;
> where 'bar' is 'char *', and I don't think you need a cast there when
> char is unsigned.

.. and just to clarify: 'char' is always unsigned in the kernel on all
architectures since commit 3bc753c06dd0 ("kbuild: treat char as always
unsigned") back four years ago...

            Linus
