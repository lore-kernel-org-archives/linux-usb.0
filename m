Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526BB44A3F1
	for <linux-usb@vger.kernel.org>; Tue, 15 Sep 2026 21:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789508304; cv=none; b=nH4rgnnRuT355UdawZKczZC0Yjp1zXzLdozFqRC/T9CoN6SZEBk7KSOgG7U3SovNFhXib92GLpQFerQRUzgBev+Xw22Vcdz/8BrSV93A1ZGkQlRWkRLlQCdeKsia21E1QkxLqcLAwltFvNTR4wEqD2YbIa9UFiCcdf16OltYG8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789508304; c=relaxed/simple;
	bh=sRJdjMNq8iNjwpDIBmIuNCaQb8aJVuFJtpaL92IS5G4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WGwlMKiZp3g8t1UtB2TsXkuDKdVU8UGDRGYH4j9HcRxpDq6DH+2luR/AcBfaFQJthZKXvV8yBsalw2V3yUkUwZz3lVrXNH6cSTEleBDYGmT/uE6/RVOXBmrN8zUZigZq7CItdwtv9avJ6mt5uw9KjO9N+2t/EBrKIuuFV0agKZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NkPNjjH4; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NkPNjjH4"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d822dso1968065e9.2
        for <linux-usb@vger.kernel.org>; Tue, 15 Sep 2026 14:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789508301; x=1790113101; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sRJdjMNq8iNjwpDIBmIuNCaQb8aJVuFJtpaL92IS5G4=;
        b=NkPNjjH4ifWfKCLHhyBQYoFDXvaCxHl/snH+ZzcGXQ6PAaAw1xX15lzb6VHsNpp41H
         dui6RZiXwRY+bBwEg2uSJjGKVBv9Rnq6Y5AmbmWSbTLzZXMfzH0+sYTLGyqNdZoszVLh
         vaKGESyrKLTFjnq2S/2R2dPr/PLZt6UlvWX40qviv3X9NXhekJK0uXmWgbuuatiP0EMT
         MRCY8+cet5lm4t1akTdAWehW6R7blkp2Dfjh6UmFdX3bZCpv1jIsIdLnniE5dxA0R1OH
         uP+hSfgf4xbtymHXRsyRJTv3PWEqNRJU3X60PnX4xx6ViG6gEWgIPmw3vJnJDF2zTNxM
         9SnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789508301; x=1790113101;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sRJdjMNq8iNjwpDIBmIuNCaQb8aJVuFJtpaL92IS5G4=;
        b=OYl5XiM4788XZFbbgD8usOUo5SzZCLGjmW0LEg+ryoVwrvgieRdoJcERiA75cnBWYn
         pmGGtoThs/7W4Mruwbli1X1+uaANcSCAKgBB84W77cVvjG6S/nwWXTxM/7wKoKm1+suv
         c1tkhn2hL/i15+69NErV0lJG9IpD/DSKKydvx/NoWSJVGjxHzUstfuPmRbxH7Oo8y87B
         0sufcGSsKfIrFspKjZpHIutJfBx/FztApi8WCkuOMiiORMkICN6uHPyMbCMNwGVZxETE
         XZn3G/BLt74vTsrlxE2bRPew57ZwEdGXuGP6wN+mu5H5I2ge01gkboztuqm/DizwVw7F
         IZZQ==
X-Forwarded-Encrypted: i=1; AKwUvBxbF6oO67FM2d+SjheNoLDZLZrSsq055Efh88gHPDpPvJCkGJzkoGq20ZL3kVC+9epuiOojavjlHqM=@vger.kernel.org
X-Gm-Message-State: AFuF++mm7Q8jI4QZOub89TCxx1VqlVjXsgjc/Eho/4IeULkiOSn0kQHZ
	t9aYfWupVMdVFmuiIdIGAYDGdIlOlozr0sOnNP+1rzIkP7pKMtk8RP0j
X-Gm-Gg: AYBFou1wFhScSgJNHTn9u63Uvtc50f5FBwaNGwMuVQnJzOSux0FE+/ENHtmxpuslOxn
	Vt9dbySgBkYyozDoagLAzO6I7ptPj2VCFmqfTPk+rfXnpmzV+BaQ9J1k+8WTs1ygPCN8garoily
	EEY73UrU08r+e8sttmnRkdGu9reodt5wBbbsdKBbRlc1kTh5dyuS43+IZhb04Bta/BiQ82GBz22
	FOfUsWltAm+lwzhx8lYP2DG87wFWr7jTgr7qDa3slkAwCUqljFS+wCudr2H/r2ss6jhqYkrop4r
	lIVY5DBJo2OnZbZof6wa/+NmU9U3m7COl6S2fdr8BFAlNErdLdedWYW+9PBKovWs/c3o1+SDJd0
	5nj712Pyd65y/N4rY30DAiVCuWCG+dRN4cn5EJ2Dv3pWDG1Es9LQmjnGvV1mZT+wUjrjd/tXG5O
	DGSLCwJujc+sxDrHYCjcfzaR65qn8YOZqAtmP1GYMhomC4SVvAfnjKII1jOLjkt18rYXcijjU01
	EHCuEWZ54Q=
X-Received: by 2002:a05:600c:c168:b0:496:c1f3:e8f8 with SMTP id 5b1f17b1804b1-49e7a662e89mr107381965e9.7.1789508301467;
        Tue, 15 Sep 2026 14:38:21 -0700 (PDT)
Received: from foxbook (bfh234.neoplus.adsl.tpnet.pl. [83.28.45.234])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf27ce2sm1927059f8f.20.2026.09.15.14.38.20
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 15 Sep 2026 14:38:21 -0700 (PDT)
Date: Tue, 15 Sep 2026 23:38:18 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: djraszit <djraszit@gmail.com>
Cc: Oliver Neukum <oliver@neukum.org>, Alan Stern
 <stern@rowland.harvard.edu>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [BUG] uas: JMS578 returns reproducibly incorrect data after
 host reboot
Message-ID: <20260915233818.5881ad97.michal.pecio@gmail.com>
In-Reply-To: <CAFKhL9eTD7DxtxMSMuUVP9cDG7Nq4jvrkTCjYfwr9puZfuC4Gg@mail.gmail.com>
References: <CAFKhL9eUM91rtywaz_7Mz+4mJH2b2csmOmc3+86ii3a0Ka3Q6g@mail.gmail.com>
	<c335085d-a824-4632-ad3a-c06715258c81@suse.com>
	<CAFKhL9f6aLZgerw_7bohbQWvzMxSfd-m-LFcuNP1_p1vWkN4=Q@mail.gmail.com>
	<1320caa3-85b5-47dc-aa2d-56d3b003c6ef@neukum.org>
	<CAFKhL9eTD7DxtxMSMuUVP9cDG7Nq4jvrkTCjYfwr9puZfuC4Gg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

This looks bizarre and it isn't even obvious which device to blame.
Have you tried any of these things?

Disconnect the USB cable and connect it back, without powering down
the disk or the Pi. Can this fix it? Can this break it when good?

In good state: disconnect, reboot the Pi, connect. Does this break?

In bad state: disconnect and connect it to another machine without
power cycling. Still broken?

Regards,
Michal

