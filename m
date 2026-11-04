Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793822729;
	b=pFmBl21MLKoneImtYUNjM3Ri4Z+/jBLIiWb+kbRes/oaaJuAHM33KcKOw2ObPmDoWEIh
	 PDlqFOm+ffDxmau/rg7xdYfUU5eb7eeHf0ieE9xFXAe9wfOEuqfuZqUSL37yRIFP64Ta3
	 BkH52hqg0dB3XSOIYcBwhgj9ScwHjo8i8u0Nn7bywHnlHq2Y16kFDtP5ussPUC/f0AZQd
	 Lf90URAdNJqi1SuLEQmMB8U0XX4yVpY0U00yaorQXwKWRsrDzH+BzYCBU//x7NaWZuRV/
	 suOGQmgH8q4QwjKNL5zIRitI1Ev49Ga2LjSAKYD6kTQPRgqiKn8XHAtHm5RH3jPHfQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793822729;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=LCqiLHf1DIbfKNXx3ccWkvqxBhOdwo3yYkazQxIGarg=;
	b=EL5dF6AsO8pmFFBXFzUXAEyiVnMXCiRe5LyVaJOCZnji20IrTNXuJY0YU+PyMHDzOxGT
	 yAUB8kI15hXetCemiXv4Y81/BPfAopTinvE2XokdL6638+clocmgZvqoRqzWLo3jQH2lJ
	 mUnrrBb9o6cVNRVh3YXYzCeMScyoY0IUsgsZV7CS8KdKE2dVh2C3A6spoPFSabu/nc8Ma
	 HBq8EsNYZY6ngaTdSvTei1rkS7bUGqUmilmznSb19G/e95unvov5GSxEyyKEc3dMCk6r7
	 xxmUMQseEzjAHOnIbQpOr/DVf/fTZps/GFPbjNaChCMjgQADWa6VRswCfaaI2mI5Mog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=fI2nmlcI;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749C5606EEAF
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 20:05:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 749C5606EEAF
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=fI2nmlcI
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c423b145922so162306766b.3
        for <linux-usb@vger.kernel.org>; Wed, 04 Nov 2026 12:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793822727; x=1794427527; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LCqiLHf1DIbfKNXx3ccWkvqxBhOdwo3yYkazQxIGarg=;
        b=fI2nmlcItpwZxqRsmDWssHJaMT2IN8dLg7E1xDQbx0Et/5dAwJ3lC+28bQvSn3TcBy
         jCCz6aP+hY985kmEWKQ8J3n3DZJgb7Mf7tqsXWxEtttRySDwTo9j3SEkofmGPUukuzUB
         aTxGLiQfrDGmJiexVo8c15QHheFgr9P51oFII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793822727; x=1794427527;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LCqiLHf1DIbfKNXx3ccWkvqxBhOdwo3yYkazQxIGarg=;
        b=UZ+VEadBWRBm6fq07X07EYXsO1PFKAjiTQ9blPBdsuS3IOqQRcgxZqr42m2urcpc7G
         zb6YcqxBWFtt9EoEFGvBcTKVItT8R90nmrPiyjCcPPH9liEs/jA47zkp0g3B+8jxsW8Q
         ua2CVMdPsXe+jpfkfIDE7D/tBkalbYmO97E/s6LpNHGWhK6e0/I8UPRXZFB2qIHotQ+A
         U76KXAWQ8NaLDwmN9qEh9WxSa0mARDzt0nXPfw3aYiWKUlLT23+2GRJN33boHzhAmu0m
         9LkFw20nJSYhs9MBdSxN2JZ78d3pMMKp0v4IiXuEXPYKNfO6wOKFF0Uxh022RpQFG3Xs
         zyeA==
X-Forwarded-Encrypted: i=1; AKwUvBzpN1cms31Qyv9tZQrXIu3HoTGSX/m9S/URS27Za1S6Ir4XyKKHgeVnMN9MzV+y9PHIXn7rFKY1eAg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/VVFSnYF63hpS2qnzBKoTwDGy3BeqMxnriv4d78/le5E10prLA
	voHNvqWmW6a/7N3O1J+sr9TUDinLjE3//zk23JZriVM2A2rDswCTWyXRIS+fTa8HcPiqBUPhcGW
	X0MPL3X1hAA==
X-Gm-Gg: AYBFou2mBV3IkZeuSgh4HRWAxjgnxGZFQ295KJ22vaLDPogb5UQ8qbviA7JqlkDntB4
	Mcay5KWPGgYmjgdanQ0aUptugRCtKcZdOXnCKOWYcxHIcQRjr9q2aIuf+TqnC+Rw+JYY8ZFOEUX
	D0ce3L/AAR1Foaum3QvpUtO5seUXVVyP9kMDKCKqPMfQljzVUXHwCO7zyEp/oxbRtXrfWosbWox
	b8vT9YK4ep5/P7dSf4fUTLBrHWMHG5L+DRO36zP4wK1vw1nyrQ/gS/cjT0Wfe3bF3F8LvxPaTfY
	HwIqZxFr3p2G86XY79eWZ5QemKR0GEFXqwSuEHnfMmQe0vnt13Bozt7pEcF9rC4uUccLa8yyu0P
	0nY2IyNxeCQD5dSsltcwK38zj/W4PTqGyfNf3QnFbBvG/Aed/T1TDPnDRuk1yS8hniIU5SdnwC4
	VSWUl88vN8h3yp3XGiNBKD+rkZuVpwh/Wfuo2WQpPyETxWyTH4zElX6/l2mU6FDDLxLN33hjsEK
	s1aK+mp8DOeEZv+rnqq5yTFra+RfBaPkIl8t+6tA7Yo1HXfXWREmVbUG5uLKyymOSCPzu/pDsO7
	0Idk+1VSw1a35MzFmM4CXyxjriLxpXMXCikl2XGVSdGYBHL6OtwfrCr3i1nIWZ/u37Yh/AYXmZt
	rGaYOwvjV16YFRkjSPYJo22M=
X-Received: by 2002:a17:906:99ca:b0:c31:c767:adfb with SMTP id a640c23a62f3a-c4ca7432ef7mr1446717866b.0.1793822726919;
        Wed, 04 Nov 2026 12:05:26 -0800 (PST)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0ddcfa78sm105877566b.0.2026.11.04.12.05.25
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 12:05:25 -0800 (PST)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c418e215671so166822166b.0
        for <linux-usb@vger.kernel.org>; Wed, 04 Nov 2026 12:05:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxv1VskkcjxjyaTn5zD5aIqAlk/QkkdQCfRAj2dU0O5nHuYJgeHOE0fd/XWwDjBLKwIzPOrNEZhKeE=@vger.kernel.org
X-Received: by 2002:a17:907:60c8:b0:c49:a4b1:9cb1 with SMTP id
 a640c23a62f3a-c4ca795fa50mr1973235866b.3.1793822725121; Wed, 04 Nov 2026
 12:05:25 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-work-procfs-v2-0-b45cd5789ac5@brauner> <20261104-work-procfs-fs-v2-0-319e0f9a8aae@kernel.org>
In-Reply-To: <20261104-work-procfs-fs-v2-0-319e0f9a8aae@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 4 Nov 2026 12:05:08 -0800
X-Gmail-Original-Message-ID: <CAHk-=wj9Y9NcOesBBm+jhPjYa7qO00fD7g7uwX+H-k0-R2difA@mail.gmail.com>
X-Gm-Features: AclHuK9j_YIgrwhhpWOlnull6heAULBd4dgTqoOhUQQjFm_MgoIgrL1vgPfefvI
Message-ID: <CAHk-=wj9Y9NcOesBBm+jhPjYa7qO00fD7g7uwX+H-k0-R2difA@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 00/30] proc: convert the fs, kernel and mm
 entries (Part 5/7)
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
	linux-debuggers@vger.kernel.org, Chuck Lever <cel@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Nov 2026 at 11:49, Christian Brauner <brauner@kernel.org> wrote:
>
> Part 5/7 of "proc: move procfs to what kernfs does", on top of part 2

Christian - way too many patches, re-sent much too often, cc'd to way
too many people.

Nobody is going to read these repeated resends, and all you are doing
is clogging up peoples mailboxes.

             Linus
