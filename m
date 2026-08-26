Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0777F376A1B
	for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 18:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787767891; cv=none; b=EzRCz71IpxTNsouTdaIKRxZW8ZSOgiK0nrCXUiaUmeVyOZAmyTV3s0k0Ponz7FV6b9RD4r8YBuJ7jM61pIV+7VWCqGm70EzfFOno6nsfRkIMlzN2PtHixnIaVoOX+M7rQhuk9ru3sD3fQAv5KA0xLy/7NAsItOpoBtFAf6qPeqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787767891; c=relaxed/simple;
	bh=hTwLH6239DZe5yRPzb2V1G2GAB6G4ulnXpvuKPufiFg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OrYZWwbVGQRFUh8TNckLqKocgrvQtLsExc8n7jHMw51rZdieo2JHKCK23ikpox0jrXy2NX4KBa5ESLDbdvG9k5L6coU2ny5WwS4CU+1TIX2dkPpOxaCa6jPaNfX/BmuA9PWm2Z9j22BqHbNkVg6JvR8Zw5ep8EtTImWcUoapUAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RuAY91T2; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RuAY91T2"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8487b7b3fc8so923225b3a.3
        for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 11:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787767874; x=1788372674; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cD3ENK5Zz4cqB8cAmknAH7JmVcmInLZ6RJTKj7LW1gE=;
        b=RuAY91T2VT7db4CGw4AR51PDL+85j6oXkjMPaLH2/s1nxhrYPR8B/EXMR32BTrWAiv
         15TIkfG3CpxQ0TL425qNPYlA1xVp/lY93yC/KTzu1adajr0zloMRzEeiJcs0V63QmZxb
         53Y2F4nhZWzC5N/YRjPDS1X5IfdsA5FFJVNOJsCd8dyOtYYz4jYoEzLnpZP9rBSZ0LcF
         RDvr4gqCw93QoJZHC82D8ksZsFBbLWm8noxekevS0Bez3Y1H34mfK/KSQ8QauLLxQ3NP
         4hHpBWmsXDTbvb5jn7P6zLmMtL4lNbvBpixJcR1oY+1rLNaNRGEzMhHfcUOlZLBZTSvJ
         I5Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787767874; x=1788372674;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cD3ENK5Zz4cqB8cAmknAH7JmVcmInLZ6RJTKj7LW1gE=;
        b=a90CK8bErwQvVn+5OIAaCntRmNzvwmPh0mqHf+CYiJbJmMhumn5F+Q3dNBmtPso4s9
         a0hphxteYq6/2UWXweDHViK4YE1vLfakvSCVkqRPbNx9FoIPY8TfjJs22mcTIyhmTOyG
         5rgPi9fy8a2yNqGVOv3WFPAuLJhgAHE77wv1d9W/hqSb6s3Wo1Im/VVsumSAvfplRaqb
         IZSxS8HtUhUW3TdaI5Dbrl9PLJcSVCPEGJqtfrWKQ1mutZ6OOTqzR/e7kGNMCpaJcr0c
         0IN/9h6zQo/+QQQfEPuVDnolstlXj3biH80BdAb9XIk+VSzmRSja/qzcIhgkWqFaMJLW
         vsIQ==
X-Forwarded-Encrypted: i=1; AHgh+RrxVWRJ//ITo44FCBbv86YTZkdcZSlVk3g88DzAgy1Aq1UJDgd0KfZq+dZQNqNJk75aKBIlW7IzNuo=@vger.kernel.org
X-Gm-Message-State: AFuF++nuDj3ueotHJXdHBwq30p5XsSCRHkYex7EDw1hbNzLM2+MMUHyu
	RUNdnx6nff8k49UpfW8c4ePa4MOMmoqOHuies/3+3t0HSVxaS7UXZFh/
X-Gm-Gg: AR+sD13jait888J1PY327PSqhX813YPaTkbFtfWQyBRIDzReJ5iqk2GTfSehMcDNgbY
	9n9iZxJ5RlHgw7eZ3l/HXyZFDYeowN3yC7rxqrYHG2aGZ1KVeHBr2jDzZ/qFobsUFGqKYGIx+zN
	jEjPwYQV6P3vRkP7WmKWqksyTeLlIbsHwitrxBgeFRvn2cTfrzUJo/gLGtFrV6Wuz1HMsr6FZD1
	jTSeB9x1lYxuPsDo1v41urWSIEDQ7C2HjKuAmNZ3RHFueL3vY980KC6LDRHbaTzvd+l877WHIYv
	NVgTVPIawmvILhh5BOrDcf1LhCPIhajKHQuwhneI861borUvRVnGXIIkNPgUn8qRh58WmmzriHq
	uzPP4rSrQ/dQU2pHrdMFBEGhKBskWdWsEHbZ7C9bqWJcBiFrGuNqJ+zOd+hk3134gZz51s1oume
	f5CBp+MJhmvcXneSgdplmJjaWr7f6Z+phDahb5TDIwy/r6v7yCbs7qdh+PMZzN4pjzcVccqyZbd
	cmuhvC0um3IEcrl/iGDnrLQA/UHh5S8
X-Received: by 2002:a05:6a20:6a09:b0:3cb:8810:631d with SMTP id adf61e73a8af0-3cf7596814emr15778521637.1.1787767873764;
        Wed, 26 Aug 2026 11:11:13 -0700 (PDT)
Received: from localhost ([2409:40c4:3158:4e86:4090:3289:19be:7446])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32854db74eesm957162eec.18.2026.08.26.11.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 11:11:13 -0700 (PDT)
Date: Wed, 26 Aug 2026 23:41:09 +0530
From: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Mathieu Fluhr <mathieu.fluhr@gmail.com>, 
	Michal Pecio <michal.pecio@gmail.com>, Thorsten Leemhuis <regressions@leemhuis.info>, 
	linux-usb@vger.kernel.org, regressions@lists.linux.dev, stable@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mario Limonciello <mario.limonciello@amd.com>, 
	Forest <forestix@gaga.casa>, Slavik Dev <developer.slavik@gmail.com>
Subject: Re: [REGRESSION] 6.12.36+: usb: hub: post-resume delayed work
 triggers > uncorrected MCE / data fabric sync flood on Threadripper 7970X >
 (bisected to aec11e5f9c45)
Message-ID: <ao8bM2SrASNh2u84@eggarch>
References: <CAPyJwA9P48LDcOr7u_iT1WPFBCHxh9w6cxFvyi5GS3syM6crbQ@mail.gmail.com>
 <07435e6b-ee30-4c85-8c8b-0ce3a4ead1d9@leemhuis.info>
 <aosGtkE_diwVJJtB@eggarch>
 <20260823174059.46fec036.michal.pecio@gmail.com>
 <aoser8dLytrwqBC2@eggarch>
 <CAPyJwA8m_Xd2oyV1i9k+-6f7A-j0FiC97yXL=Ci8ZAErs5W4vA@mail.gmail.com>
 <ao1ovvdPAy6n_F7I@eggarch>
 <CAPyJwA-QALkCQn8J1+=U-nuE_7WSEPhVcUEKb+MMYMaA_1AVjQ@mail.gmail.com>
 <ao7aLXk9q_v_jEyX@eggarch>
 <d5a395f7-06ad-401a-b026-e975f620f017@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d5a395f7-06ad-401a-b026-e975f620f017@linux.intel.com>

On Wed, Aug 26, 2026 at 04:40:14PM +0300, Mathias Nyman wrote:
> Roothub needs some time to settle as well, but 200ms might be excessive.
> 
> xHC can triggers wake (PME) when a connected USB3 device starts signalling wake,
> but port registers changes are not always visible to driver before link training
> between roothub and device is successful.
> 
> My educated guess is that 120ms should always be enough for the roothub.
> This is also the lecagy msleep() still apparently left in xhci resume
> to detect port changes in xhci runtime resume if there are USB3 devices.
> That msleep was supposed to be removed now that we got the hub changes.
> 
> This 120ms can probably be further tuned for roothub in some cases,
> especially if resume is due to userspace action instead of xHC wake signal (PME).
So the patch I sent above unintentionally brought the total hold from hub
and xhci side down to 120ms, which worked.

And the correct fix would be to bring USB_SS_PORT_U0_WAKE_TIME down to
120ms and clean up the msleep from xhci_resume?

I can prepare a patch that addresses both if you'd like.

Regards,
Lovekesh
