Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793348388;
	b=ONI44oFMgf46WS7iDpmCYbkM7Wx5u3/PCsKtDEkss9kRL0iY/ZIQThqR52WTIJekQwxJ
	 HL8lKVX+kw1BiUtuG/6rpbbjA5ckk0c8JAOoNltKghUli2o6gkrZe5M1SvjIsIrEDZEY6
	 nwY0sR4NAKVFclFrFn6C27caKz0s+zZ0W5gZYpH4j69qB186TjWf8u4U0M4t5tvRzHBqk
	 GcCKPyflc1DJ0mE2onMLlYRVlVhKo8y/ol7GeQ+/Hgs3Qm4AfeJik2vMBacwAtKdBt6OH
	 0X8479QZYh1Z0pjOb1dd/Eci49dixYNfj0ls/mlfPcBkXPJ44y/N8BS2IrWZjaqDEbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793348388;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=5k5+smRzBG/D3lDOFAkhMGxxPi4SQrohRh0tT4R9GYY=;
	b=27x0+YL/CeuIQe3O141LCeqdAaQ6Dt/ezXnXIHTGr+KAdEFlJPdYX0pqMpByRRXrCSz7
	 CSuwkil4uA4SIHJ/dI6ShHIl00Lw69gPjuPpsuWVwBi8m/H6S78AULijb42RKhLCsYoKT
	 JqKSFrd/D/WTTZsPh8jj+oEmKUQimYWFqVT5z7woxorr5ttcPt5aaJXbWvWfgfWaqg9EU
	 Ao8BGy18y+KfJ2yq4EuFCT2bvm6euDdRfAMSQDeJ0SU4IvdqEpk0I/tFrnrtucMl5VrM7
	 lV99R9LPaKiElQ281Alw43d5m/Ww22BL3CvTg0C9pFj3m6DJ2uCdfwbsI5wewAysi1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA13606A31E
	for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 08:19:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DA13606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8a60f90a924so140462b3a.3
        for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 01:19:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793348386; x=1793953186;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5k5+smRzBG/D3lDOFAkhMGxxPi4SQrohRh0tT4R9GYY=;
        b=BuJ5aL93BENjDmKrMKSQ4W8t9415cfc7Uu1SxM8VVn84vl+7LYC62W/pbrru4wrv3X
         2mQbmQoeggk0tOHJGJAOtYJx6trLNH5F/IYLMaMqyUwb1GitJUDzk0cMpEDwLbQVpc+t
         ndTYr6BQUnzQvcL8mI1sUWslItibiJ8Yz2lG0J1ho/fM/HLSFmdkBNCup5YI2w6GYdvR
         /N9vSWFtDLdftON5hXRoQcyV+F0EMKX91Z+XhfAZjKkhcRcm0aPcXySwGxN2XAYSXLkS
         OUh7n3xlao/DoFNz24KcMNhbllTRXYQUMUGwuXpsYi/hFO+2/V45kwFbwC3ImXGtA1vn
         Ugtg==
X-Forwarded-Encrypted: i=1; AKwUvByahvByi/208Ye/G7ZfpjJ92ept3Jy0M53Mrh7KjT4ggJrJfgP1CL7BYBeKwLHnemgWrP7E11yhy2I=@vger.kernel.org
X-Gm-Message-State: AFq9FYIjnKBHFxjLrtKTkH6EE7Zu6YdV5R1uEAtoWE66/op1dxZtoYYu
	6XOwKkidEdpet/i58d+1vbmGHAv4Nfu15TN63xTeX5yiUa05sQWsVVYuQ34peQ==
X-Gm-Gg: AYBFou0O8bDt/BkTXRlmSWTR4d86ufj16WCl8WyfpoYr1fI+rrKQ+GP5SxQTwVtW/RY
	o60K6FksIU12HG7WFxr9H+jy9mZ9d4z75ph0sdH2B8fU9JS1UdQ6GzM5jiRGaRomzBWW3iq/SnI
	SUC8+BDkOc+16tA1l9FrKYzBMtltaX+WHzpnZHl5LhaV7rMR7W/q4pZF/Wn9AbV3LbXH4bULiWm
	uHMLzCVUH8wsACEuOOc++sgF+0sH17vlHWjSG5hlBRLtjmqnc5QbZRh6Us5dyeYNTattuEaOMS0
	Jp3FHCUvVMLfXEQ6EvqdArSfYENb05DAwZl28dVGc/h2/h83JiMg0B0OUuPBZt4iapwhSJ6wONK
	7VTXbsPaT2Xi9WLRpBgNvoGORCWbrHS4OLr7joHZCZcu5KcdkBpnll029gggHpkSCnoKpKafG3R
	XS43SuPq8zOenKkDC9tbNEojop82loj938oTge5PLL07UKCRf+JfXdJ1YuDoudb4MHa2qVRSL0H
	Te6IUbaSgXiQo0/2Tufrk44r+dIsYJUQRqhv25vme8w5rfEPkKy2VQAOSMD4R+XWZ0AMOB1l/HR
	kg0cDP1hGsBWZfiTu4EGHUDkCJX3NAXzyzS9Xbf13PahmA==
X-Received: by 2002:a05:6a21:7309:b0:3e2:a0a4:8ab2 with SMTP id adf61e73a8af0-3e928aaf470mr1560461637.2.1793348386408;
        Fri, 30 Oct 2026 01:19:46 -0700 (PDT)
Received: from localhost.localdomain ([116.128.244.169])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb096d3827sm417269a12.12.2026.10.30.01.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 01:19:45 -0700 (PDT)
From: Hongyu Xie <xiehongyu1@kylinos.cn>
To: Ingo Rohloff <ingo.rohloff@lauterbach.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] usb: gadget: f_fs: Fix mmgrab()/mmdrop() balance.
Date: Fri, 30 Oct 2026 16:19:41 +0800
Message-Id: <20261030081941.652055-1-xiehongyu1@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260901120908.14386-4-ingo.rohloff@lauterbach.com>
References: <20260901120908.14386-1-ingo.rohloff@lauterbach.com> <20260901120908.14386-4-ingo.rohloff@lauterbach.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hi Ingo,

I ran into the same imbalance while carrying a backport of 5eb5c72c72fe in
a 5.10-based product tree, and your analysis matches what I see.

mmgrab() is taken in both ffs_epfile_read_iter() and ffs_epfile_write_iter()
when the request is queued for AIO, but ffs_user_copy_worker() drops the
reference only inside

	if (io_data->read && ret > 0)

so the reference is lost on every completed AIO write, and also on an AIO
read that completes with ret <= 0. Moving mmdrop() out of the block fixes
both cases, and it stays balanced with the mmgrab() in the iter functions.

The released stable trees carry the same code: 6.6.160, 6.12.111, 7.2.y and
rolling-lts (6.18.y) all still have mmdrop() inside the if. 5.10.y and
5.15.y are not affected, they still use the older kthread_use_mm() code
without mmgrab().

It would help to add

	Fixes: 5eb5c72c72fe ("USB: gadget: ffs: fix mm lifetime handling")
	Cc: stable@vger.kernel.org

so the stable trees pick it up; the change itself applies there with only
offset differences.

Reviewed-by: Hongyu Xie <xiehongyu1@kylinos.cn>

Thanks,
Hongyu
