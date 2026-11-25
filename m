Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604744;
	b=0VyYZVIcNbDrPj0HdwxHsdldugMMiZBV5d9VnTXdMMN44uvmg9Il/SvV4z5d+B4tD6aY
	 G3cM9SpKTfhI6UeBSzqDI5JjiQLnUR6Y2gViUBR5mO9XfPk4AEUJK2D9J2sveIZiy1a1X
	 hHfxDbyfsBwjoDZF5q/PTxV0muUjdtBlGL9N0pyEvviErJXkjLzqan9VPXU7QiXvPTcwO
	 OFkSGcsT1uykS8p5m0paF4Hp7xUB1zER4FD+/nZoJAC5v07WeYnK0XEfqIYkzqBArWNks
	 ltY58SNusC5g5ohZ0B45ypVqCPFwcYOljTtX8U2elAgOa93sr7RdReK7qqbDjWSy8CA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604744;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=h46JfrdBgUALfGNgCjBaPmKw5l4xKTUQWTAKnBkGDa4=;
	b=a0mRDg5JZ+Lwbe7jhFZ6SgrnP4d1P2ia+TE1jQaEjI8nLNreFlroLAW8C3+gNrEJfheR
	 fZJt87/YLjqjWGz/WRrKEsjUm8uozor7NIrM0/q4akpQlEmB9WtUOslRmraVFBCIh0xxr
	 +BLUfjUcBsfaa1maqHbKBdpeN7pbarL10gmycn4yhdPC4xPowYzh73XX9awWiDbOpDC2F
	 VId2RZ71tO39ivfCxjszuCvgFbf+FdtvQ2xJwYxkzMTN7EtBd3ctF+gTtYX24fzLh84GB
	 0GUdWCxkqjgijiOxGC1IQcBK1WPypgfq45AYsHHu/fhz/d/tEYBbLVvZXBtwPwKvOzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hnjpkmn3;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D0E606A321
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 11:05:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95D0E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hnjpkmn3
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bba5e17728so5057365e9.2
        for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 03:05:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795604743; x=1796209543; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h46JfrdBgUALfGNgCjBaPmKw5l4xKTUQWTAKnBkGDa4=;
        b=Hnjpkmn3YkogUWWGubPCnak+axyl78vFI1wvnAaWisi5Ix2aGdEhqKqoNLZjxsHR8m
         3a2UEHA3l7AWc1toBEkONDWy8PBPy4Zt/W68fVAVx2LVxeraQOUyleZlg19CH8XvPRj+
         Us4J+StxEckxbDln3J0SdNINzAnvMIHHi2rcW27XGBIUSQrwhAA0kNDMZHB31uTxrm7o
         X/4RIHiMzJlQBNl8n8UDc6LMrPYSwBbq4K/N1/+kYgtyZKtPEIzfrLQz/ONFpeQgrSQv
         wvQgXNqNUIs1tDU0BOlelDsOqliyc0RBHfe9slBD5E9SfesfJ/1rGnrD5vUb4FqeHDJI
         kXjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604743; x=1796209543;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h46JfrdBgUALfGNgCjBaPmKw5l4xKTUQWTAKnBkGDa4=;
        b=0jrtrvs1G7voHP8aE1yJ8BotfKuWcVrxjJA66hu4+fDN8YPJjSW+gPgKyX8xhEv8H8
         iF/8L7tKJwAilaWvvkTFKgM4981/BKVbbwysRC61wKH+P2Ehywf5mUPI0LEUwPFnuwse
         mZ/DOOFiXlhXIitzR9xC3kWGEWmUxmv7KxhVnlG962lLrwfplSZJKE7OgwpNPXOohs4A
         fs6u7dW7SfNI6e09BuZQgx/UUB7cH1E/tg2uOec5DjerP1gVCFaqRUJYA/YTMt03UJCz
         2+FncqJUtNil/3E2lnq0n7eqSLIQ//IbHz9Vut99lViIJo98/VXrOb9UvdU2jmqpg9SF
         7Npw==
X-Forwarded-Encrypted: i=1; AL+hErEzEX0rXKrE6Rd8WiARGcTY9iNP5IMYY6pIAjQ0GLJ62aAslJVGX9Tc0zAkkdQ7aRFxJQrOeNTTJvc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8sRsUWVvIg0AyzjyizwOtzPkNzqkbR2ocjVikwiyEcJ3xK5HIk
	eVcqTgXG0JuBu5mp0crHL2CIx2BZ3n2AEf897XiH2p9rLDgKGxWdauiC
X-Gm-Gg: AZFdTZdvVuv/ErlbHaxtUDHa/hVgyKTQrePvSm7V9Z/KctpuzwqJn3GunEvFMkuHwu5
	u14nNia1r7C9dYFQN1fMlO4+kYroTfQP8/wfoLWORulXzrdBRQrOEbh9i4IuJQjZnsHa9O/kGlL
	CJeryNPOTJcNHj2lGrGV0RkFkg+anA23luwhx36QQSKXwnLW8qRGt256n+iWjw002KYS4kOBwsI
	WA8D4NOBD21/cxp9tAbe5kJ6RBB0vAbc1zT50gHwamS9ZTrqlRC4nI/Ne6hnQgjlySrkI5m3YAO
	7wsDrt/52l8xu7v5pNrau+50RZm3Troeu3nrEG1zNKXhHbcmbwkpQ1WAE7LnOPgtl59KEWaiOVj
	fLmvE//hZb5cX+huVKlz08MYkyNgE0M30LbLKYg+DZmXs2gnzUfZQnpXcvsKqeAmbJCUB7YUfQH
	8imM7YhuYgZClaG7ZPTQrLnjWFgDtn9qZnndmG7oDYCCzCWvvFWzAy6JaEEI8cMOqDVJ+7afKmv
	CJmTEA8HHoHSrECQ2wV1DY8/ivtvtH2mMofE0Cp+2fIqv5V3QGFRn2rBy6zADM+h+ov/Qu7a3W/
	YCVL3DzoaMlPrF4nuQQtECxtNvTNYfdfXj1FHzjnFQ==
X-Received: by 2002:a05:600c:848d:b0:4bb:52d8:73ef with SMTP id 5b1f17b1804b1-4bb88940f1bmr350139265e9.34.1795604742721;
        Wed, 25 Nov 2026 03:05:42 -0800 (PST)
Received: from foxbook (bfh118.neoplus.adsl.tpnet.pl. [83.28.45.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906635c7sm303198625e9.2.2026.11.25.03.05.41
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 25 Nov 2026 03:05:42 -0800 (PST)
Date: Wed, 25 Nov 2026 12:05:45 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Kuangyi Chiang <ki.chiang65@gmail.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] xhci: Handle missing USB2 resume events on Etron
 hosts
Message-ID: <20261125120545.76f07ed8.michal.pecio@gmail.com>
In-Reply-To: <CAHN5xi2dFo2NFbMb8t_5uugX56Fq2=Jj3G2_5xA0-b_NTjQsSg@mail.gmail.com>
References: <20261123072320.5967-1-ki.chiang65@gmail.com>
	<20261123122343.6d3f8866.michal.pecio@gmail.com>
	<CAHN5xi2dFo2NFbMb8t_5uugX56Fq2=Jj3G2_5xA0-b_NTjQsSg@mail.gmail.com>
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

On Wed, 25 Nov 2026 09:33:38 +0800, Kuangyi Chiang wrote:
> I tested again on an EJ188 with three USB2 hubs connected, without the
> proposed fix but with extra local debug messages to detect ports that
> are in the resume state without a Port Status Change Event.
> 
> When I connected the first mouse to hub 3, I saw the same behavior as
> in your test: the USB core checked all root hub ports, and all three
> hubs completed resume (evt 000e).
> 
> However, when I connected a second mouse to hub 2, the root hub was
> already active. Port 1 also entered the resume state without an event,
> but only port 2 was reported in the status bitmap (evt 0004).

OK, so I'm not sure how you reproduced this problem on the two-port
chip, and commit message was wrong - the root hub must be awake.

But now, if I disable root hub autosuspend (echo on > power/control),
connect two devices which use autosuspend and remote wake one device,
the RH wakes both ports and only generates one Port Status Change. It
seems nobody expects the other port to be affected so it stays stuck
in the Resume state (SW is responsible for transition to U0).

I don't see similar behavior in other xHCI root hubs, nor in a few
external hubs. Anyone knows if this violates the USB2 spec?

Regards,
Michal
