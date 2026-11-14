Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794633517;
	b=T4AqQcG/ee7ifdnCx5xxDMI8l/2oS6KDMWcia+yh84a1ki0lN21zb4zTvNuWfF6cLfYj
	 oF6sgs4c/l2qzZWBzGFkGf+VlCNMJSfVzD1LhSLdTrI1WFKHSUKswgJqxriPhnjf42Hf5
	 DaqpJQRYzQc90qxj5GrOBGQNJDv82+f+GEQ4VrldHWbX2cYOiEztK92LSR3VFvQ7gcuc5
	 Fy++oqOB2X9j07VZ09BY2JXqejgWhktZjLTJAZgJOycNVnCebnTu5s3iLYcwUhQes43xT
	 oTHp2u8V7G+kM/FLx3azD32ttCt3tXEvit214UtYbSFnLeTEE5UrkrEcsiUbXXhcOYw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794633517;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=QZepFGhbJzlLfvq9xOUY5XlSYHu4zw+0b86yQizHsKk=;
	b=WMPIiOMRs1re245+uupdx2ZZStnK5wjUvvztzm/KCTUs4DGE5BlnNNCmCAIXiwxHARD6
	 dGuD0vkjZ3MEBYp2oI2vLdyVeJgTfHjfWVut3+slgHQ5I0OQJ3D/io2lvqZenM60zcv6g
	 4c+PlVikWVyJPKdjY8h9sglEiNgwePJw8o6/ffp4yXWCKma8kIuHFqYD0Pp7UIxf1QWwH
	 7AL57kTQvi4BGWjqc+QnwBypQNYOoGl3ibRSVYSl/1rSGs/1nDqQ4gsc3i6wyS/2/BlVG
	 bhWv0ETB4dyaN5YUMaYo5fzBfJ8kHTjXTtbZ11lDD2FG0uYnTLBS/Rr3cx/kbZaV8jg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tt09t7lG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.43
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E085606A32D
	for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 05:18:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E085606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tt09t7lG
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-91e8938fd01so29163676d6.3
        for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 21:18:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794633516; cv=none;
        d=google.com; s=arc-20260327;
        b=JG1rWLMB/DmR4GTuU99qenXLUx/J8TjTOcWgvrPp87t7UMxYdvOCb610i22HdTaNgh
         NLLG398AJQEvkAFEfq4tSv4DvWk3o9hgJoJa5VA8FX+45ggo2b1YLzGzOGunCpmrJa83
         YKfZegSoExNEGVinVDrnaG8ZYL+RrOI6LWSMenSA+DOLuj6qWoop8Fdbt/JUTxmaRTHb
         /RdKtQ9dXemu7IwuW7F6bIjC5ZrBBUbQNt8vxyernBnmifvuX/cVjEFUj9x03orBD1GA
         n3SuulsrE4nho/HPpTGJXI0g4bBpzCfPBqW3nPIclbozWQPE9RMjVn01snxdPeFxBeMm
         amhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QZepFGhbJzlLfvq9xOUY5XlSYHu4zw+0b86yQizHsKk=;
        fh=PpEuB8lr4fVX817y1Dv29KLuq1Neeq6kzHQv6Jxdi58=;
        b=sz2TBBmZXmV/skoGog9xJC2KDbB/EDxrmnCsYPFF/xAiz3fTs8tlrc0236mFtS8vyF
         YKMk9BZvStSQNfHTYvA8CZr8cgzgW1BTEUj2CW+WMwGRL6lS4g+EJvMlm85JAqX93lYw
         LKn6peXFAlI0A9N+SdfE8HllbpwIbmz+fdjtjiEANzXKbxDwJCKPUOK3DUsJYuwnodmk
         IoiR5PhR3e9uH2jjg27IDOKpXqWvyWrLuoXfQ0OlvHx8buz+2T61q28rGiOR7NJA1aJj
         z5wxD8NgzhAR9YzejhUZOHTjalqlr3oZE8+SxFDhicpURJq8WSNSKAAIhZJ6VlxCw6cC
         AEPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794633516; x=1795238316; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QZepFGhbJzlLfvq9xOUY5XlSYHu4zw+0b86yQizHsKk=;
        b=Tt09t7lGscB0cCnQBYFBnRK+bJZYgLQoIndD1y8Z7jDoxkgW3qQBBJEvdGU1awSTkL
         znAq0qnJ7Pog7Rfv9H6rKYJy0JmhW6mCJsyoB+DOV8C7kF7ynAwLgPrP1AB4OzDROM0Z
         QyOrticqVumIPgkAEsQ4kVm5mC683TimDL4phYi6hnu/3FBkgUhFk34mnomc62KUDq8m
         uzl6TVHuiePubIUqOviFouPNp+3szljKc/TRlyTNQbdWT/xz1GNzopc3U7/fEms4VcRF
         TzJ7MInocO7mb0/7AKszVp6f8/YdMGuwY2cFm3ajYwYCkrBK7U6+Yo8jECblJ7Be1QOq
         1hZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794633516; x=1795238316;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QZepFGhbJzlLfvq9xOUY5XlSYHu4zw+0b86yQizHsKk=;
        b=HFORmj9qZn7t0ReXIQJQdTZDCqie+stWXLiTYONWYgy1CLlRAs6gvIjB36iDW9IEwY
         AjEhtd8t7+SWrecRhK5olD2CweuRQNE0XTWxISw6pVb0tQ//wa9+5p834MwstGr+qDV5
         tBb/yFoaIqOPGhHPJNEccvgycaOeTzD7BM1KdWbvFNvPjHwHBTBwUklDK9rWCKkfeh0h
         rUImeOJFFkzmWyIvPOUW5mugskBpCUBc4EOP2iGq0Fo8LNq1q0AUshNWz/L6Px/DfOvc
         +d5tupsvPrzZGx+NW/bAm/cg6wVVeb6kF6Qtc/dZNWCVe4/UE98VxyW15sb7qpBgSVNW
         o3rA==
X-Forwarded-Encrypted: i=1; AL+hErEES+EKhO3DGwe3aHzouv3C11DuGjq7J446nSKk56JqJ/wpT1poPWA6mmG+CjZfR6DW1SRMdnGYF24=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ny9JcNA1qh9RzNVvlSQiTPFP504uCcj5aK6SfsUC8g2TW9yyE
	0ChD3b0lFttwQM6MX6UyphS3msL5lmXdrfQnaYG8+56W1+eAaLVLJ4F95bxwbnyeZLt2YPnlpRT
	p8rFBVdNUOgtef1+K6sx/L5Y8xwCDihc=
X-Gm-Gg: AYBFou12otxXYdVAzFwITn2plWv1DgagCvpa81//Y9SMLAKNxFhGBGm+VRvsvQ/ehdy
	DdwmEJ+45zrIjcpzxQcRbN+oMMr3XQaHlqwkME6MOz2ex4vVjs2zFuR7j1YiPlbQ42jh+81HT03
	yX7sSdBvvfjOyLl6zuBnqWsUIHcRZS/UEznO7AHSgHZZnKD3LgYcyGxPx4dKAsPaRxrlL6TFSPW
	7ckq905e4+s4NdBMBPhiidkA6ZG3SF+s5nvvs9WJNtaOLHzwYWwUQkOV97BIblJKmvpyz9vXcN/
	P0ESXsXN1s9mPe7Y7iAs5R/OspJvTbHdQ0vuChLOXFnTE4shlsfDjkLtOoaN/GRokl9vuxmdJeq
	CaFmIj5A+uR6Pto3KXFXGzK0XgioP4gYoDyqUa/99zosG4nZfaDoqD4+Zcg==
X-Received: by 2002:a05:6214:1315:b0:91e:9693:1dad with SMTP id
 6a1803df08f44-91f2418bbcemr76958436d6.20.1794633516437; Fri, 13 Nov 2026
 21:18:36 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114050954.275495-1-artem122novak@gmail.com> <179463314815.2168702.3601648779918603836@kernel.org>
In-Reply-To: <179463314815.2168702.3601648779918603836@kernel.org>
From: Artem Novak <artem122novak@gmail.com>
Date: Fri, 13 Nov 2026 23:18:25 -0600
X-Gm-Features: AclHuK-ysfMO1m51fCmYfB7QkCzo-oPWNJOqR8JONxvHDkoWVwWrsjmRva2E1u4
Message-ID: <CAPufuha49_gkJxbLYrc=3OtbeFd6MMUSuuxEznDBnA+hDTOfJQ@mail.gmail.com>
Subject: Re: [PATCH net 0/2] net: usb: smsc95xx: propagate MDIO errors
To: netdev-bot+sinfo@kernel.org
Cc: Steve Glendinning <steve.glendinning@shawell.net>, UNGLinuxDriver@microchip.com, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Alexandru Tachici <alexandru.tachici@analog.com>, Andre Edich <andre.edich@microchip.com>, 
	netdev@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

The issue was discovered after a kernel panic on my Raspberry Pi server.

I investigated the failure by inspecting the BCM2835 SDHOST driver's
DMA preparation and PIO fallback paths.
This led me to identify that when DMA mapping or descriptor
preparation fails, the final scatterlist
entry remains shortened after space has been reserved for FIFO drain words.
The request then falls back to PIO with a modified scatterlist.

The patch restores the original scatterlist length and clears the
drain word count
before returning to the fallback path.

Thanks,
Artem

On Fri, Nov 13, 2026 at 11:12=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wrot=
e:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
>
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by LLM and not proven at runtime). If it was triggered
>    please include the symptoms, like the stack trace or kernel messages.
>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account.
>
> *IMPORTANT*: If you do repost (for other reasons) - please include
> the relevant info in the cover letter or commit messages.
> --
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.
