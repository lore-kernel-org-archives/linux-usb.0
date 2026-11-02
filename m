Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793642724;
	b=kWvFqt5A42L0YuTc4C8gTngMFHvfVfakLZ08PEkRan3d+U88Q80M/11QYD16n9JMRMJU
	 IXhZK7ZZxrZTmN4eI46KIqeXBr62GMHixIYP+I31ysN/aQ835wWlUtoAzShQjFFRRvL9p
	 LlDLZo0ysY8rFbtFLMIHxQCSmV0hCFex/jQ4is1p+BsHtDE4eHnd9zdXHp99rvqg026oO
	 uzTU23cY+wFJhj9rojq6CwWm6gw0f3gWqTIrq20m4NlAHBIAZNbu5VA9x7xci1AQolQ3n
	 6qjZ4Lv5Bw65FOquM+dFhNKmvhPR0VMWEcu1WyvD0Y2I/eTkNvUMpd6cl/lhcMK2Svg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793642724;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=/vXXDZI2TLqXD/tqTZGHj/cF0YcMq0fXP1TpWYkM2ME=;
	b=nZXremN/1ux7lHxIpS0pWMa5pMZ9K9ZQEBs0Yl5IpEvfguj59OIihyUllpZ/5V1PGMHb
	 vkzarn1IsHeWnED4MLPnKEIhEYCRxGU3Ah/41hvOY24QTNJXeI1TxJIdfJpHVtrjn7K4F
	 nr6/wSDEuf+jA2n9wjwG3NngY/cVOd9YV4h5X8ScrYxpoPX33YGPX5iZME/wvS/O80xcj
	 mxfIaAg+M5ijXeYtMZ6dxwSgfL428EibFhnOafcnBYu9X8Vk6X/YNf5mO0kPCupHG1d2S
	 /j4kkX0HxXAuyTDKxAqIYSb/VYSsaZXAJoUTuvPIQ2F5XWSt1P1WMdx6mlmitTCStxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=JSgERa+A;
	arc=none smtp.remote-ip=209.85.208.176
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C921B606A32D
	for <linux-usb@vger.kernel.org>; Mon,  2 Nov 2026 18:05:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C921B606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=JSgERa+A
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3ab3b29a210so35839431fa.0
        for <linux-usb@vger.kernel.org>; Mon, 02 Nov 2026 10:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793642722; x=1794247522; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/vXXDZI2TLqXD/tqTZGHj/cF0YcMq0fXP1TpWYkM2ME=;
        b=JSgERa+Ai5NV6ty6BIQsEAuQqaqbS/rpg2rpe5PviPP9yNPg7S1LlOCtunDffZUkLP
         Uy8caYQ/w+TcAk/fpcBK0cLdMm02CayioFi4cHUvooacgyF4946pbfIGUS44oVIhRS1J
         42cqgIyQGTyNClvmHK37Nj/C+Z0b4dCOKGt00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793642722; x=1794247522;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/vXXDZI2TLqXD/tqTZGHj/cF0YcMq0fXP1TpWYkM2ME=;
        b=q5E1BOmmdOQlN4PZ2VE4E7jiTFN1DqeD7FUgxwBETh+ENnkvmo8Hw2/7Jn0o8AgHvM
         DK/3LZ2nxJHvuhkd01i1nj9Qlbj2e0ql4AS8PT9R/AnmNk/gnVsNdYj448kF8PT/0Y0x
         1M+g5rw6HOTiAVKrHuMvrfDmc/PLh/gjkiwqB3I/mN7JiGpe0B+6WScxYHjXQBL12WXU
         3htBJNPFo9zLj5LJIpgaZB0Z1A+OHHIweWDi7/0XBSMVatsWILBLHeUri3y5JdOlal88
         9KHg4fe6cteJdobKJLgU+8IG3HZV+sSWWhiogUfdP68zFJUD+GqdnLP6/1QIVsD31lyb
         eIig==
X-Forwarded-Encrypted: i=1; AKwUvByqVXMWAAIlyycvnEZC34NsmXh60mFSgQVeUNTobkajR77J4qIN6HP5bdFpFh+lYZM9oSwkm8jGkcw=@vger.kernel.org
X-Gm-Message-State: APuU4Z92Eq141RrYCBzjSxbgjJ6XmkswGHSWZsyAtt5RfTxikVdWv6SS
	xhQlJ0boRveexdVTO/iXaeBcLo1ffWRRCJNPDbzGnv/qR4vKoLSQPgTi5LaYupptz3hUk0815l9
	fSGcmMB6fxA==
X-Gm-Gg: AYBFou1TNTpF8JHK8Gc0r1Eu7sX4STcGJ/gMQ7lTJBxhiQt1dTRsADV5RbG8JYGxRc2
	vIg1/U3yaKnfdE3O5FdfpfpaTh++BR/hEgnilK9Jt89cMUbmo6U+lz3rsXgyfqcPU4rhfQCUbfG
	DZXly+LqoyXhWmBiu7NFdK+7i+B4CUJXrK/3TKhwAbeNF0xw1dMgVfhRqiIzVd48BzxxTxQ2Slv
	GLhfuCp4zO/nw6Q9pcG7WGLtSABjUmBPZShW3AIt76kmGk6JR+J4bjSzWIgpYTivZtzi9j+jY91
	QJYWDoljDPcjAPrGECtjTm0SgbJ+z27Yqk/qKvjj4SXebUylpjDy/CEvFLe6DItm5UQgo07UfIw
	2M72pUO6YWyiykI6+wzxeSbyqOEtzDAed0fftbD2LOGLi+v+lmJPLdXPLVJa0rg+zoxQ9Nfhh7E
	ZYUucfB9bUu6nRuxx4I7YZG6/g5QU+gYxwA1UY7iRIgi2W0RiE7nErqPcOfOh5g+xo8VUxUW76z
	5yqfE+aD47lBqm4lQDQf/KIkkuceTCuiBjXXSuEaW7rgEH4md9vIoFigaHeAdkjO41SrvzN5HSy
	jOBMAXzl/5JJNbDZYNBTyg+15AUSRn+va27E5a3NusMqEoemUoSBfPHDU4fXWK8byrVkzaiFJxr
	hiw==
X-Received: by 2002:a2e:a99e:0:b0:3ab:40b1:c4a4 with SMTP id 38308e7fff4ca-3aca57eb24cmr32943551fa.14.1793642721891;
        Mon, 02 Nov 2026 10:05:21 -0800 (PST)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com. [209.85.167.53])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acd5c3b584sm868551fa.22.2026.11.02.10.05.21
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 10:05:21 -0800 (PST)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5be4fea434bso3801550e87.1
        for <linux-usb@vger.kernel.org>; Mon, 02 Nov 2026 10:05:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwvFnvSzjIlC4FyUtWMygteAjnrpJlO2UZXMy/w9JCCat3sqCXobeMRMKDmmJqu+bMxUcjDcTymKcQ=@vger.kernel.org
X-Received: by 2002:a17:907:d94:b0:c2d:c80e:8366 with SMTP id
 a640c23a62f3a-c4ca7426f6emr874452266b.0.1793642348398; Mon, 02 Nov 2026
 09:59:08 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-work-procfs-bugfixes-v1-0-59422ed3e465@kernel.org> <20261102-work-procfs-bugfixes-v1-1-59422ed3e465@kernel.org>
In-Reply-To: <20261102-work-procfs-bugfixes-v1-1-59422ed3e465@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 2 Nov 2026 09:58:51 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiSA7-mqmAjTQDaU7UjUyWt0TxYwXHafL8ZAPudy+B_uQ@mail.gmail.com>
X-Gm-Features: AclHuK_qZTBVsLQIdymgRHScSFenC6XsGggUDmcuOugjrSTbuVkeASUmC_hYPZo
Message-ID: <CAHk-=wiSA7-mqmAjTQDaU7UjUyWt0TxYwXHafL8ZAPudy+B_uQ@mail.gmail.com>
Subject: Re: [PATCH RFC 01/38] PCI/proc: don't truncate the position of config
 space accesses
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jann Horn <jannh@google.com>, 
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
	linux-debuggers@vger.kernel.org, Chuck Lever <cel@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 2 Nov 2026 at 06:22, Christian Brauner <brauner@kernel.org> wrote:
>
> proc_bus_pci_write() truncates the file position to an int. A pwrite()
> at an offset like 0xfffff000 turns it negative [..]

I think this would actually be better with rw_verify_area() just
checking a per-file maxbytes.

We already have that logic for lseek and friends - using that fairly
hacky combination of s_maxbytes and !unsigned_offsets().

We should combine s_maxbytes and unsigned_offsets() at file open time
into f_maxbytes and check that not just at lseek but in
rw_verify_area.

And then things like proc_bus_pci could set it's size limit in one single place.

Hmm?

                   Linus
