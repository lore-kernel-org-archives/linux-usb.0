Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E8753A8BB
	for <linux-usb@vger.kernel.org>; Tue,  8 Sep 2026 12:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788871742; cv=pass; b=eviZvRE6ZUk8FsoVnLsbKFmpgQ7XWiCtoZWCKx79Mjq30R/TTtp0FEDu+275HmvrzBLyXh/O+gggjmRmKRAtzQfF3y7XZ7Hf9aC97OsjHXX5eUgICT799xCtv5wdRAHxq+SZLrhldmnqAfN2GEHA16lXO2/JXcS9jXc0KwKD8WY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788871742; c=relaxed/simple;
	bh=78Hqg4JS69EObpzSUByjTj00CCKytaf1mVYb9pI6H0c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GRO5CP2bm3+ivR2PDuuVxfPBIp3n5nRbvFkzELhTOfH3hyjqzOgbDNzvrbrCHsSQVDM8NiIdRcGHnKPaj1g4/+eDZAB8Bo+t2fSnrmo1SYbX5gSUYDi+5CP3//RogLfKYl6+cfkPuKJGrNRy8IpELyMnB5aFtHG9+CXkLORBHD8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sRBFzKHr; arc=pass smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sRBFzKHr"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-90e7bde5596so58851196d6.1
        for <linux-usb@vger.kernel.org>; Tue, 08 Sep 2026 05:49:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788871740; cv=none;
        d=google.com; s=arc-20260327;
        b=C8QbB2mAnTHnpvPes6PBaJxAVZdxJZF3wMn4SrmomnTC08PysKqQY9BAui7V4ba7cA
         yUd9TiSKfL1S8PwM+6Wl6H8aWjjchrs4x6vmjg8A1PxbBmUg44scvd9lzcRKm2o4RhDv
         Y2HO192rG3lDey8vxja5OzL2Em0gKONPLUzCHzx4+i1ayiY/Bc6UmBvL8A7xKdHXftBw
         sq0YBUIN4qsDJxBmoyKpnn5lXePp7+tKTwh8EJ70ePb5A1YnqpwkoQh/9un2ZZeqQ3+6
         PN6XMRlP4Lq9wuugqfIW0X0RjbID1oZuA5p5mvmTLtuxJr/9sZEYjVE5RKIrCqvD4adB
         1xpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BUiVqNsH2BqPxyyfl13B8I2hyyPsofxH5VCL45yPH5g=;
        fh=zh/yf2oIMGNu4GWtG80ARxpIYhonmDTr7m/CDui4KRs=;
        b=EHcAEv7VgQKPOrcGDIrgQopEdiBugsZNTgIr5dnH9G+BlXB0wQu8Yfo0glciUjcnFm
         w2bNrSRbuWUv/7AR/15FbYdEsp84L2RiY77hlx29t1VvCl5QzsbfBpz7HU+4e0b3p8qG
         vZ7uSyMrLyjpwa1fgYCgJGyQnPbHo8cIZ5RQ2ChLn+oeUr3xjJdQ/wV6hLvoxULrp+Q5
         OxX9g4RU4aBRI248RGy3c04u7zTuhY+vzlneb/WmqhgQK+WY8KXFU6LpeNcsF/xYq4Bo
         ads+KgkHtTgrOL96QsDwVuGh+nMs7hTs9kUnuUE+obLjtBZkalS6SEVjFvxI6deBuCmN
         g9eA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788871740; x=1789476540; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BUiVqNsH2BqPxyyfl13B8I2hyyPsofxH5VCL45yPH5g=;
        b=sRBFzKHrUQwC0us9AUEOo8Z9s0U1zlmdX+HHaNyNC0OxEU9D2kiP2Yd72zuD6DLklI
         unINQf+V/+Kxgkg0Rs6DY3VWiemUisbpKGMS8Mwg2W/TUo2UZvLTY1YIAA+vm62vJLuc
         fUpJZGVQue6ZhQfEYYSPvFyPS09tzJSff19lSPJpmfkRoLyIxap+mkGMbSUvXKeRwpvF
         ew9N94huxmOQ55kHRl7qEqITUjjXO8GbPrZt2FTZCwBGabEYkiszROKSx/c2BCJZs5IY
         RiujL4HFA676rs8cB0LFwNqgxX/jCS8X7Hb90wqhdrbvOSwWtri4UWeV70r+uzmw/YOE
         MxqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788871740; x=1789476540;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BUiVqNsH2BqPxyyfl13B8I2hyyPsofxH5VCL45yPH5g=;
        b=ZG4Qaz3vsCK+qAwwPDaX88Rj0erzQ5qL7wLm+j86xl6UP8g5eTge/gIk3e34GYQ3I7
         edzMQlda7tJbJ5VJbraQ44P3JxJkUaQUH+cNEwtFatDzpagJV0gU8JacYbPKUFlTz4xe
         Qwj3fBrOYlPfsB2qID/CoqBwU2SGdoyAUJ/N8M7aXuhcYdpqBcEIpKR25Y8PkwmVVnf2
         6Q++B0X0OMukyGKosr/bffEgidqvtNTBHQ9CMPF7pfiM+OcqrN4anJkxCRwv798hRa1F
         8ouY93NnFPJyZBUoyZedBDqZBsa+TDrUV2BxqGj8Nvr5TjI1JQUlAFlsp7xECg38Ee+B
         fiDw==
X-Forwarded-Encrypted: i=1; AKwUvBxAlP81OApGxt1Pk6XOXdJtZ7BX4Rt/R93Lk2eJZUwBcm4kIlJ8Sfs9trKy/qJwr14Zu35hy7d3Yb4=@vger.kernel.org
X-Gm-Message-State: AFuF++muc0sCQn+mBXtt5BdSW71yNFOt6SmStBEWfs2D9RNxtXxL2kOX
	iCDm9jIHWpKIy+lW0Ksjc4RGuexx/KDq1SSRQeERvPCkQgyEEzqwF+vtPeyYcRIGtvN2aS9z10e
	qi78L3fb6k+WgI/yfGePO8B+UqykqSmA=
X-Gm-Gg: AYBFou3VsoUDiNlNZ9MCGsoniynuZPQs6vs8xM9f1rBlYI8aqpJVva2McdN1gKFczVc
	nf0d3UXUVWLKLk6Fc+PH/3UpNSDUjm1J+p3nSgou2weSjbEc9KQNpLeSlTzJohjOX1g1feGWCek
	oqrSmQ0wo1jhjR82WoluBrM5K/wDe25OqIE4f2obSItYk9Guz4M5JwDR998sS2WEpiOiiDkAnQx
	IitLaHVMFfc8w8nA/GECAZBpnMqST5jKoaz9Kdth46wdLq68EjIIp5mftB3P1ufp7UPpC1PmThP
	eeCEo1JcGrosyIo0TQ1ccevoH8sp9PqT62WOfP+bDk4e4w==
X-Received: by 2002:a05:6214:2f8c:b0:910:3451:341 with SMTP id
 6a1803df08f44-9103efb48afmr389824056d6.32.1788871739943; Tue, 08 Sep 2026
 05:48:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907-ncsi-over-usb-v1-0-6b74d2f1196c@gmail.com>
 <20260907-ncsi-over-usb-v1-1-6b74d2f1196c@gmail.com> <08083379-6eb9-441e-a656-0066c9006dd7@lunn.ch>
In-Reply-To: <08083379-6eb9-441e-a656-0066c9006dd7@lunn.ch>
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Tue, 8 Sep 2026 20:45:36 +0800
X-Gm-Features: AcwNN1VVwv-AZVG7aa6d6kuiXNW-vhHZ-9WmoGIa_ElFwS3ifzk9WoGv7iR7QI4
Message-ID: <CAGfYmwUTsqgDQCP1q=XxCyW=R+a61urg_Jnnw_3-oJfw_BU38Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] net: usb: cdc_ether: add NCSI passthrough support
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Oliver Neukum <oliver@neukum.org>, Samuel Mendoza-Jonas <sam@mendozajonas.com>, 
	Paul Fertser <fercerpav@gmail.com>, Simon Horman <horms@kernel.org>, linux-usb@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Cosmo Chou <cosmo.chou@quantatw.com>, Mike Hsieh <Mike_Hsieh@quantatw.com>, 
	Mik Lin <Mik.Lin@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, 
	Adrian Ambrozewicz <aambrozewicz@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 2:17=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +/* NCSI operates at 100 Mbps */
> > +#define NCSI_SPEED_BPS               (100 * 1000000)
>
> Why 100Mbps? RGMII is often used, running at 1G.
>

Since the original NC-SI specification was designed based on the
RMII protocol, simply set the speed to 100 Mbps as the default
for this virtual USB link.

> > +struct cdc_ncsi_priv {
> > +     struct ncsi_dev *ndev;
> > +     struct net_device_ops netdev_ops;
> > +     const struct net_device_ops *orig_netdev_ops;
> > +};
> > +
> > +static int cdc_ncsi_open(struct net_device *net);
> > +static int cdc_ncsi_stop(struct net_device *net);
>
> No forward declarations. Move the code around so they are not needed.

Thanks for the suggestion, I will move the code to remove forward declarati=
ons.

>
>    Andrew

Best regards,
Potin
