Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794362420;
	b=LKtNfyInC7D7QgVekG0z9UwjpXOImwTpmQa7lEg+qbJRveX0TUUOvWL/i/NdpE0Ibnhe
	 Al5CfdO4lmjYuy9ZTcJXC7AvUoLq2Dg8vhkSBNxJPrPT/VZ9+WZU9vJpymKO+Jita0LWz
	 xHGHHkYLFshSf1guHMiOu4zauoIKYVPtn3cyGhfKlRACAqqUcjieObo84OABzoTBjoW7w
	 FKQlKq46dT3KM0Gnhb6+IFvoB3vTVpXwyPPRDGs4c2rxV+PQ/tYwjQGhl7EqhFHU8bIAn
	 YhlKi2ubkGmdmS6JgE0dzwXERTNEtGLWztz+qj7U/gpkYC/CIFIAYGvANXtXO0m6VzA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794362420;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dtC/s3IFvRHvWLM5ctW+2r/vaRjYMyyM7FY+73RqcL0=;
	b=tazZqlyPQ3VsHFmccL0hPg4t4CMrcDseFe62NguH7rC+DqzlVLjsIAbtu4vqPNF2XRau
	 XMEtmbfE2WvcdTMegSUT9+XUziTgQS4LrjbDhE7sgdme1DyH5eNNM3RNP7AVfAQdJABnf
	 RZi7xzp6ku4zErfC8C4+VEpcx93Bwi/3Vy6EaD6ct8YGFlOtnTSWHlcKDNeQKLnC1WUxT
	 5NXoVqctjnFc2qxFEWlerK6J1rbc1EmoN6wg9RLKp+DvkQZUV3IvqzNGGA+h1NvzcJ0CO
	 FC6xSSjvgjG9n+hd/Yjq73hCYwXFD0/mgg4s4LXoJ5sABwUYCevQsjDHb8GkSzkNxjw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xjVuYftf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8CC606A321
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 02:00:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA8CC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xjVuYftf
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso5474266eec.0
        for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 18:00:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794362419; cv=none;
        d=google.com; s=arc-20260327;
        b=DzsLnCTNPWwypYGS020bTTjAvnEmxGNvF5iqsCTxnOYKdBDv9wC4stGvzUzA3Yjynh
         ofIJdftLbcLsUneqVxfh6+6OKlhSi3VMtG9g9myQjIzXFgqrqjWzj9fQtOXx5NISQcI8
         +mvisqZ6Q0EhRiRvTCQdzF5wWgJlnzIsvD2/YONlQdurbiQxkVPdSRyadsm82f/jucwo
         fzX+hrA/fyWW+fKMFY3Z+eNXxINFlaZ4Es974QR94/eOpFpXgCgh72tP3Ne9GSgvTOui
         89VvXRAAzCfcXgKoD6gHDEbTVH0IztiYZg9/Pqc3MbYmYCjyAq7OVUrUmcovP/aqGcwc
         k4Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dtC/s3IFvRHvWLM5ctW+2r/vaRjYMyyM7FY+73RqcL0=;
        fh=WcRiJkMg2cWJk2SfEg1wpUhAUdEZyYY6ZgDExnCSSCk=;
        b=KsWCU7IHej1B2WNK2YJ0a2J7xn+dHyM+vUFSvs2VW01FQLG2NVPjY1V/2Pd74vrKmu
         2RrzOzkX1c5ia6UAxyZoddkgUKZS7SkdunIPGBLAWdL6w02pBKxu3UV58hjHWMneI0ng
         wfmhp1BPCeYlkc52NPeq/FLzthSLzRw8+YgC4J0ZD9DP6uyw1rbUSPvyEHIKub7M8p5m
         3WJKeA16t0+5Iy20eR8FS+TPL5Jk20Pjo9Q0UKi4xoZk/vZVMBdrsvcyLcX2SIVOt2av
         tTJUGKXteJQGW3Pg/UTR1HEAWI/kVEQEEbrqq4revCFXW6l3a5Q0BQjOGuP/AqUo1DgD
         M2zQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794362419; x=1794967219; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dtC/s3IFvRHvWLM5ctW+2r/vaRjYMyyM7FY+73RqcL0=;
        b=xjVuYftfbW22npZtzpf6WhiVEWc0WBE+dsO2rihWR0FYjSd/7fa30rhy8p66cRLOlz
         yLw0MmIsSOmTbhPY608xIBUcXOkLqMYc25ks2a90fKMKMPMwn00YOoOx1pKNS6riR1hb
         YDkro7/E+f9ueS6/aq6FCSN+nVSqAqsITh4gvP9JgOJw3v/jjMmaqvzEQZxUiGQiEldV
         ldbxyijCYbqphrruR4lSSgq2tf5dXYtae0+7B/R1DCSjytQH3Sj6Dt3FsftJuD1xSO2F
         ++sIfyPL98r5wg1WLFulDNojhNamprh7ctnCrznqJyMS+XINnL8M4Q8W+2dlkLrWDGJt
         TlNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794362419; x=1794967219;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dtC/s3IFvRHvWLM5ctW+2r/vaRjYMyyM7FY+73RqcL0=;
        b=1U4wR/oHqrkto+zyeRsHkmkmMe8dSNJrnCQ8+PTankLdIIYfKtYfyOqJOjpIJEdNMc
         4NceQZBixzvG3j+pyDkdqwfFYD+IlNgD2CzdHBwnlkFuH9+TudBU+uCwcWyoo1hQAgrg
         NQ2pmiE1aY5kFUa2/NFq5kAE30IFMq3pjpA++Bb/sAT/VifJRIhn0W3EnI8tZ/5wz01K
         qgEIzvIeGHeaW1LpBnciX4Ms49PY95iEeiZ6Jhjtf/Ev57gltEUpsKuD43w+ErjuSaJ4
         8G5NhQORwsOWH/S13p0LC4VAOVSzIwnjXZ0xC5NAKKiX6QleGcwkhps4RmbqaLNYIPxG
         wL6g==
X-Forwarded-Encrypted: i=1; AL+hErEfA0KEYTno6RxhSL6GuI/f+RUEXm+FPC8eG50rzfKaulsT3fDcAUjSFDptHjEfEcZdyuiGNE3RqFA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+nMGbJkDtMNiEyDoqc+VEjHqgh9PQv9FwFUUUBdGqYsDITBAFn
	XK4i/W268xDEsJ+9/N2Uay+mX4/pEwsU5kJU1tT95PkdsBgZexXTh4Joh0Iuuwnt54mGpKXq1Ir
	vtpOcnZWZPHkMko+M6mSkawMmR+aKfYU=
X-Gm-Gg: AYBFou0mOYojStDqwbPAowIXYWu++31Vbr4r2nvuPxMHMxUcQb0e2rEbcXBqrwE7jsX
	UtSb9V2e1F74Dqw0uvQFgGhyc2W9QX5sNlXvwq641SBp04E9GYLcrvmuQTo6ua6IAP52j2asqTF
	dq3qGj3YNiyyqkm/162UF4sFqS3CjR029aOcMyok4FIGKcoXwUd/fGRos4n1G48+Ctnif1ziMdt
	c1YP4nqvS8FbgfmYKO8dMudptVZCgtGByTknQ4+VZ8kixW5heC7ZC2BgwQAzhdTAFf2bW7A0+ER
	Wf7kIUkeNqFdDeJKowUpC61i6pNIIXjWkVA4mg8Dtv1X1kc1O44EA+JwraZrm/REdZNKCf9pDxy
	IH/muNA/TKzzvy6c26Jf5LL8wPR0fQLouzs3vZRmjXEkKw9+T3lhbrtTXNX5DQojCgYN6mMFNi0
	ZgN58NOiagdJN8EBhkrwPeLRru+k0=
X-Received: by 2002:a05:7301:795:b0:36e:e349:f2cb with SMTP id
 5a478bee46e88-3768579dfa3mr1470248eec.19.1794362417519; Tue, 10 Nov 2026
 18:00:17 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-smsc75xx-rx-fcs-v1-1-4e048bfc28f3@gmail.com> <137b3cc5-7077-45d9-8ba3-ea4c584f1992@lunn.ch>
In-Reply-To: <137b3cc5-7077-45d9-8ba3-ea4c584f1992@lunn.ch>
From: Joas Antonio <joasantonio108@gmail.com>
Date: Tue, 10 Nov 2026 23:00:05 -0300
X-Gm-Features: AclHuK8ROedb8-shxTvKJCqZsFUqIT-32EYB708a8vtoB04n-gGoY_3AV2iFUVI
Message-ID: <CAOCBhwFSS_weykmFvmHQJ0VuMxW-dxHytBn81rn47wfWwnsV9Q@mail.gmail.com>
Subject: Re: [PATCH net] net: usb: smsc75xx: reject frames shorter than the FCS
To: Andrew Lunn <andrew@lunn.ch>
Cc: steve.glendinning@shawell.net, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	netdev@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> I assume there is soon going to be another check to ensure the frame
> is big enough to have an ethernet header? Can these checks be
> combined?

Yes, that makes sense, thanks.

Looking at it again, short frames are only half covered today.  For
the last frame in the URB usbnet drops anything shorter than ETH_HLEN
after rx_fixup() returns.  The other frames are copied and passed
directly to usbnet_skb_return(), so a frame of 4..17 bytes (0..13
after the FCS is stripped) reaches eth_type_trans() without a complete
Ethernet header.

I will send a v2 that tests for size < ETH_HLEN + ETH_FCS_LEN in the
one place, which covers both the underflow and the missing header.

Regards,
Joas

Em ter., 10 de nov. de 2026 =C3=A0s 19:41, Andrew Lunn <andrew@lunn.ch> esc=
reveu:
>
> On Tue, Nov 10, 2026 at 09:03:21AM +0000, Joas Antonio dos Santos via B4 =
Relay wrote:
> > From: Joas Antonio dos Santos <joasantonio108@gmail.com>
> >
> > smsc75xx_rx_fixup() takes the frame length from the RX command word
> > supplied by the device and strips the FCS by using "size - 4" for the
> > allocation, skb_put() and memcpy() of each frame that is not the last
> > one in the URB.  The length is only checked against an upper bound and
> > against skb->len, so a device can report a length field of 2..5, which
> > gives a size of 0..3 after RXW_PADDING is subtracted.
> >
> > size is a u32, so "size - 4" then wraps to 0xfffffffc..0xffffffff.
> > __netdev_alloc_skb() adds NET_SKB_PAD to the unsigned length, which
> > wraps back to a small value and the allocation succeeds.  skb_put()
> > adds the length to the 32-bit skb->tail and skb->len, which also wrap,
> > so the skb_over_panic() check does not fire.  The following memcpy()
> > then tries to copy almost 4 GiB from the URB buffer into that small
> > allocation and writes far beyond it.
> >
> > A malicious or malfunctioning USB device can use this to corrupt
> > kernel memory or crash the machine.
> >
> > Reject frames that are too short to hold an FCS, as lan78xx_rx() does.
>
> I assume there is soon going to be another check to ensure the frame
> is big enough to have an ethernet header? Can these checks be
> combined?
>
>         Andrew



--=20
Joas Antonio dos Santos
Cyber Security Specialist and Ethical Hacker
joasantonio108@gmail.com
LinkedIn
