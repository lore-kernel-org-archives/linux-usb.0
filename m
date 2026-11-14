Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794694413;
	b=YxdpnYLTOpBj3G+mO4iYXs6N7HI9iI+f36vcQZrypa/afpHcyb/fZBAsS1Do1cE/RVUS
	 Avq7xBLyMDRpXdXlkOtIZ1Lj9YzudmvC3/464HWocuX7D8kp1TmbFT7rQ2iUFQJMd2xNR
	 PMAC3Lq9rd5Gf/iQmBcQZemP7N+oKwb6HwD/07tK6+N1ZEe0Gm84q6+DxVOcWLE4VLwvH
	 pIR1mDmrQf2PVQmN00FKztR1Wf/cD5vJAyCJ516upQaRrWaqQMHotu5eC0xgYGbjSRdJY
	 PddTiaRYNtO6twhWCdYyjIuD8WG8cHfkUqVO2sZfytD/qpy2yNf3ucF2vuIzKQHjrwA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794694413;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=W3g4M4BjGhy7rHyh3nTZclDx7LvROFXp4qSX7b0zXGQ=;
	b=gSs4KWWVNENsB8FIzwQel3qsWLlcnsmgVMYOmXPFH9cfghpcETWapIPLAa/Oe2Qwfcrn
	 sYV4i7bzcIBJJVripUYxkB88keCcX2dKXRUFSWNCk4aXff5bALgRk8jZAOgRDN7b0vz+7
	 tbm/4x0IiT3d+zjUKcvcXE3ojRohqLbXXhKbukSChjrxMKRL/MIy+fXhXdjM1RuNKftgn
	 lVQC0YDv+xACmCuvNgKazXYpo2WQHjfi/DV/7dW2DGxuGHVE7+k6bIqaiaFM6TF3FNwBw
	 jSXv/fac5qrEKpgHbtVJMsJQPhnHyEcUL+s3+gvkjQAWXRqIf71+h+uejEJ70haHsiw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yE6tqWNZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E01606A323
	for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 22:13:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86E01606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yE6tqWNZ
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-55d2dcbb905so2863791cf.3
        for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 14:13:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794694412; cv=none;
        d=google.com; s=arc-20260327;
        b=rzwLIvyhkqxBVTmSCfpAHPsgz6CNmwvErtOhSzKT+pIrBoYytdvAvTQXYAU1FQH2nw
         x8BohacF/R6HphKG7Iqavr64oxjHqLkYTi9pT6j8RC3aBbS7cod2L52hNRRZKxbEVljZ
         EM4sl8+rw1g8gzY3lBWyf+j08Tnh2x+PQjrWm/afjgUhi4RxiloSsCV+Tb6R4xkF4A7k
         7HSsuVObis3REygszyux+xGBFOwYzk5PDO8ddyKkPn2AH0SeTMiv3qseCJCc/CfhKihx
         7PQrEaL3CtWSFvF6LYlmMPo1k3OVnDWMmppj00buDy2Gj5S/6eKXMHXWfD0Wqzi/9DCd
         0l1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W3g4M4BjGhy7rHyh3nTZclDx7LvROFXp4qSX7b0zXGQ=;
        fh=isrEbI73uQJlVrvYAyelJp5NE0adsmlTGnoTmzgg6b4=;
        b=o+oS92+bBYWu9U5QL1FDJ0QvP4UNt38eHmDDiO65iNWbvI87rv1WOg3/qM3kwVAXdX
         NR6vYkdi7sD8kReO777MahpQd1I8hBxcwzzTOMYlyG56C0166RkpzXxgPgfeUkrsay0Y
         OtXmuXrmjldX9KIvtZhlbCtZyHSiKTTpEElxlk/U5ZTda4chM565jtUyNaOJO+FXxtIi
         ZPNMKS7HklWVZU1JFZ09JjNmiNF491d5H9YKa0HOlm0aVxk5Wv4cnsnTb5LNp119/Ar0
         EFSs+9gde2rVYhmiTdoF8JO4rJdvs9md1r7Ybl4QeeklC5lPGIvOIgruCvMzO2U8B+xw
         ajLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794694412; x=1795299212; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W3g4M4BjGhy7rHyh3nTZclDx7LvROFXp4qSX7b0zXGQ=;
        b=yE6tqWNZpdQ0ChZDmQFufjOo+1BS6L5ma3KV02rOqXgw2VyK1gvMXYYGCnLMayKpn/
         u4rryftyTb8Q6aQCxgw4qk57RdFjnxCBnGmOE/afJrhk5bFer/Ico/2lRELxzXT01K3e
         sUt7byQ4WsK6rMRhrq2moJ6I/f9+kY8GtldDNB1uw35ZLR7TnhxyrkdHlCzDYWJwflor
         86YQm+Zj9CWN4XrWmvxxkwoEsyFfUV/F3dK8G3RQPgWtDxiM/j1y1VSBVI9V0ReNS+33
         AQEGq2R119KD8ev9eynBjH86/X3r9oTSkASeyMH1wxKXlWVOzE7w7YBf4ZLuZPBueJ6t
         i9+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794694412; x=1795299212;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W3g4M4BjGhy7rHyh3nTZclDx7LvROFXp4qSX7b0zXGQ=;
        b=0MKF4wRW/3bJ8WW1WIYJNAUrL+oJeYu62MIg0Q+CklDyTeKqfHKiSF61ZCUf8l9oyg
         mqYsIseHnAsfLHVugAaF5eZDq8OGRnXXbIpyZNxoIFByvCH2i11zZErXoLCMF4VENhtS
         jBobhooHoZ5Sxv6gflp026FcsZrSW3WTY19/kSkWIXz9S/8mZP0xyX3plyPD87vZPXMD
         Zj3IF0jNp21xig8Ma9YHU6MNahWtt5ten+B+Ooto3FlZe0krR/+WJxm/PPeG2p6E8xHX
         1b5Ynqtw8KmwSn+/nOD8d3oc/oEzZFS5F02PZrHvL8yGh29R5GPDTU/k42yx75bIRF9N
         OSow==
X-Forwarded-Encrypted: i=1; AL+hErFVnxvYB6ogNrOb7g6rKC0V16SH+OaZVALxNKtap2T5xFPjorXPzpNfkGi0pdpulD4lKSAaPlowDe4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/XrxIqEyTzRyoUPEMYjLZ0eewrt8Qb70QRodN8MRvn0Q4zVXiE
	tmSi1ha++zSdbR8ZyrwNsQJjrIcSKveiNPbfCAtT1hNePK7jFwcz6PzYfLsilJ+4imPEm6NPUCy
	A1UMvXbCKjFRkl/tk7JVi+rQA2LB+9l8=
X-Gm-Gg: AYBFou2ZMyx8/r8ULmEsHAeTbhBUZUrOTF0dqB6NMpva/aM6ideb+COOsoGr4RyD8F3
	eEIl3TJ2wae4K/AvPIZtfrqPigDghqG0wV0kSCMjVlVAs0IEkF6YU4zdaaTdNQCV1Zt4GBSQKDG
	fHWsFtG8B6Kb/TcTWOGVCyorQchBjFE69OIpKCPNO2oguQ3MjGRvUdMM7NULzAziWFlSqCOxwGy
	jeJJ8mm8K6+jRUm3vLnbIoh7544GoZxYoLpr6Fw9rkWv83ZB39TIkJwLfdzIkvWaVbKrfKBKk8g
	Clfr+kH/LisyqXaBKhxAXNYjh84O9krfauPRVgTX2KYAQbTJVxIFEGHjmo2ZjnweDLH+kvbnqz+
	n9vcMz/8cJxsRnMbK4MUVfI1iEcX+kLYCl4/m
X-Received: by 2002:a05:622a:17ce:b0:536:26db:d4e2 with SMTP id
 d75a77b69052e-55ac817f17cmr101112741cf.15.1794694412478; Sat, 14 Nov 2026
 14:13:32 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114050954.275495-1-artem122novak@gmail.com>
 <20261114050954.275495-3-artem122novak@gmail.com> <8513f7d0-eab3-4288-a097-ecb4e6c69ee2@lunn.ch>
In-Reply-To: <8513f7d0-eab3-4288-a097-ecb4e6c69ee2@lunn.ch>
From: Artem Novak <artem122novak@gmail.com>
Date: Sat, 14 Nov 2026 16:13:21 -0600
X-Gm-Features: AclHuK84N6a_455rEAqWmcsGNqLfsD8ckKdWUt5DLF-ZQvwpuH54LGUJOk1veqM
Message-ID: <CAPufuhZdNXLvwE2zAz5Emi73DysuaEZkXvjVfZDA1sMJVVpf8Q@mail.gmail.com>
Subject: Re: [PATCH net 2/2] net: usb: smsc95xx: propagate MDIO write errors
To: Andrew Lunn <andrew@lunn.ch>
Cc: Steve Glendinning <steve.glendinning@shawell.net>, UNGLinuxDriver@microchip.com, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Alexandru Tachici <alexandru.tachici@analog.com>, Andre Edich <andre.edich@microchip.com>, 
	netdev@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks,
Artem

On Sat, Nov 14, 2026 at 4:10=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > Return the error from the helper and propagate it through the
> > MDIO bus callback. Continue treating -ENODEV as success during
> > device disconnect, consistent with the MDIO read path.
>
> This is logically two different things, so should be two patches.
>
> > Fixes: 05b35e7eb9a1 ("smsc95xx: add phylib support")
>
> net-next.
>
>         Andrew
