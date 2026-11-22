Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795386987;
	b=jdJ5zwEx8ZzTpGmYjzoyv7yPZnahSeRwU1Jj3chpv2/S+vWF+pqtsqiZ7dhiJMq5BvWO
	 XBanFHry9sFF3Vu2Ig5tLwt00Hmzo9UjhoMTO9Pbt0+CLDNe6NtyNDrN2QCHo3R4J9rrt
	 iivvy5t458nGo+rf3XTM9apJPFLOaFS/euOmkwbv5EtVhmhK5E/iQ5ibXAk2O51XwBXf5
	 NuYmKmt8sdPl6+dPe/eVqDO7zi+xCeluvE3MY3qFbCa0JR9FyRnnxCwwVkZAukMmgjL+i
	 VvO27pz0vaAEy6al+8DIz3Dn2Cq7Zx/tnyWa0XwYCfhMuYuz6DW82bY7FSgeZkuVmVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795386987;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=uWvM+vYR0BVoqm9nbONEaSEkLJpCFi3QrFnnVcJ0YBI=;
	b=UuLGrq17Lvs9RchgL5IRJeOy1YSgXRkv7O7sMaV3LGMQ/WHtMg8IB7qQqAP3GhtJVYjQ
	 bO+5Pu9hOujUWFdHuViVbLqLHOHr8P3J+fpYdACY/Lu4+juz2sBcdXyeRGhtV16vIip/f
	 A5M5+K7abWtcqQsWfR4rMdY7ztQIhuY+YmX1H1XmBBruKAcRo3ZNOz9eFzKHlxkFsdfkS
	 W1486eIXlBJnlFEdOGZUXeQUwxuglkT/BGacd70kmLAuYVQgs7PDxtkLvI2IEhx6TmPoY
	 9JgzkewBSSX5JJKsAPeuITtElyk6fBVD+BIxAHQ/3t585ddk49rPujz3BR29+PcQfxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qkkZn9om;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11B0606A31A
	for <linux-usb@vger.kernel.org>; Sun, 22 Nov 2026 22:36:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C11B0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qkkZn9om
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso20324685e9.0
        for <linux-usb@vger.kernel.org>; Sun, 22 Nov 2026 14:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795386985; x=1795991785; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uWvM+vYR0BVoqm9nbONEaSEkLJpCFi3QrFnnVcJ0YBI=;
        b=qkkZn9omnKCP/4xapjal4Kxp8i3q/V+VVP9CIaNwHU+HkkB7gn4sNzJgJAhkGdBoaP
         HFcVDGRop0NR+x1AzkcPSS8p5EgrHnHVFE1aEXm0g9meFpO4Z5eoJ1znj3qqfvkv5Wku
         1Eo8YwxTLXPPoR1i8g8uKDeg6UV4i7iz7jmzOmRUe/qHil9PAVU90bM6gMG5eQIumaLf
         RssQFVXvfVvpTZUcukHgRNwtzT5rWfALeAf1Qli+eSlEHw3O3uidDZkuX9KxTHgjZ9E+
         1qfjbcJrb/E0s2xmFO41TRmq1/BvmbewOW9Z7EJgLMM2K0E9399RphesjHm5XAcP7BoT
         qj9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795386985; x=1795991785;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uWvM+vYR0BVoqm9nbONEaSEkLJpCFi3QrFnnVcJ0YBI=;
        b=oeM7zE9XisLUHuF6dGtS/IdD/1v/D87ZVruXqLSydjNtqQQppLTlr8890M6xEAAwjx
         5WkX9HbzWRSzWDy07OXk+OYHXDK62GD8xzdY4aPpJmxxaArrcjP+k5qzfJO5V3fzNqS7
         KEmO39izcsUI25RDlbBTjwKJw/Ks2UIvSb5hhNEhD2xn6MUjw9HnrVKzYj8mrzo6oC6p
         2Okgj0MefxbKOiBiC4wEmCS3AGpBlGDfnN/eUpBd1BgepsFk/LBhfA5fKP+jOL4fh93P
         CcSgBTbaZZqMxIJ58ZnNCUFqQXewZdgwmdUrSBnlrGA5bGNiOSIBcdJPHCZOrKJpxVvP
         agxw==
X-Forwarded-Encrypted: i=1; AL+hErGC85MFXsylrLxF3llxd5VPoq9Niqx+vddBzpggAKybtaJbKoJ+qMAmCJnGfukaQ9bE7EgsiYYbaV4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9isIU+QEXA44qa+lVsSDoPJ00s3FRgpSCcG+6QhVMg7FSX4taK
	dxihsAWwAqL0yj5Kol4Lu5GmbjcudTuYsNbyUsk1wse5gKbttyu7N+PC
X-Gm-Gg: AZFdTZeF4JcuxIYZFdIQS6y2VY5qK8us9vw1N7N4y3BTb3EeEtBRAkAOe6IXQPvtrjH
	P+jwqY7qIqdtCKdMXlHfbVfWueWeKxijdIxG8Rf+OS+d8QHp/Si67Z+ID+oV7hUZ50IvPzTMaid
	0y3OHQprMYdq9CD8OW7X3lTjsZxBPfe7xl8fQW73U8LgZn1a/W7VoeuuLRYZFYzyMDHey+vN2af
	qO0NxzmAq4vniwovW0MLJFSumoaMoj+NMiMrEDwIgu/sVNjdo2Tkj1yWN0FOCq+UKlLH/nFI7QH
	2EJ0HizZqOC2HKANxFhp67ia07isG4dEnJYO+PhjB7alZC3lsE4TUg4iN89It3UpB+sEv7/sIqs
	9c8ySLErp5SkA0yBqy8Px5Su+ZoSVDnRvn5KRlrLkwwPg9IUBhdloib7kRAGjD01XDqzWFNQGRP
	0Tsl4lXmKkpld5DlBjMXEV8qG1OUDue1C0RPPgWJnM7e7fUFe19/rAuDOAy7r5318tY9d5yYwm5
	gyYMjvhtPOwmDbU2tGVCkVgJrl1VZzZdPOWxkddH9jigMyIe0aTzpJ8ouTs8Jz7f9X7JLSpuOdH
	Ufg42AIVhZjnYecLFbgAuwuk9F1mcNVkRsH8njpfmA==
X-Received: by 2002:a05:600c:1547:b0:4a2:397:73f6 with SMTP id 5b1f17b1804b1-4bb8880974amr226721925e9.8.1795386985012;
        Sun, 22 Nov 2026 14:36:25 -0800 (PST)
Received: from foxbook (bfh118.neoplus.adsl.tpnet.pl. [83.28.45.118])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110ba3sm15054394f8f.35.2026.11.22.14.36.22
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 22 Nov 2026 14:36:24 -0800 (PST)
Date: Sun, 22 Nov 2026 23:36:27 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: hi@yasunobu.dev
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Ricardo Ribalda
 <ribalda@chromium.org>, linux-media@vger.kernel.org, Hans de Goede
 <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Mathias
 Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Batch StreamCam unlinks on ASUS
 ASM2142
Message-ID: <20261122233627.162cf5db.michal.pecio@gmail.com>
In-Reply-To: <179509370754.7.5011876058707374029.1785696182@yasunobu.dev>
References: <20261119-streamcam-batched-unlink-v1-1-076bc02866c1@yasunobu.dev>
	<CANiDSCsdaokL_2u_74b3ADT+U8TXskK53+k+hVA8D+PtttYEZQ@mail.gmail.com>
	<20261119124331.GR1923307@killaraus.ideasonboard.com>
	<179509370754.7.5011876058707374029.1785696182@yasunobu.dev>
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

On Thu, 19 Nov 2026 13:08:20 +0000, hi@yasunobu.dev wrote:
> On Thu, Nov 19, 2026, Laurent Pinchart wrote:
> > On Thu, Nov 19, 2026 at 01:06:50PM +0100, Ricardo Ribalda wrote:  
> > > Could you check if your device works fine on 7.3, or if it still
> > > crashes?  
> 
> Thanks for the quick replies.
> I tested 7.3.5 on the same USB-C port, and the xHCI hang did not
> recur.

I too have done some testing with recent mainline. My camera works
quite reliably on ASMedia HCs at low bitrates and ASM1142, ASM3142,
as well as VL805, all survived thousands of stream restarts.

I confirmed that reverting mainline xhci-hcd commit 7c0c31c66a7f
causes familiar problems to return (in absence of uvcvideo hack).
On ASM1142 symptoms are similar to those reported here, including
occassional "ERROR unknown event type 15". On ASM3142, HC enters
a broken state where control transfers to all devices time out.
VL805 completely stops working until a reboot.

One glitch remains on VL805 - sometimes the next attempt to start
streaming hangs until the application is killed, then yet another 
attempt succeeds. It's nothing compared to the pre-7.3 hang, but
it *does* go away with the uvcvideo patch. Whether it can be
solved by more xhci-hcd tweaks is TBD.

Regards,
Michal
