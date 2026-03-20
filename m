Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060DB390222;
	Fri, 20 Mar 2026 10:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774003240; cv=none; b=eu75OmJIeU4OznHw2O0EeLuomSMPmGy3/wi+jVprPgbGtBw0IkI55WDzLxnF4iqAZjZItUumlCQxO2QMRMR+soXVOqQ7q9foSwtbv1tTuBVImfD69DtEhAIPxrNh5HqvHUhgJghRrzAF0UwZZWseAL4QoYDQC9w5pK1dLWR04qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774003240; c=relaxed/simple;
	bh=KnM+ZKoZNavU+UlkE5/0QOIlIBLSePQQHsA3kbKujH8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BU5PtWulWfpaLjVufa16qqZjVaPLqTOeumzkhxjb6X9XZHGwVcfddn4lvTqEW709tH/yMDlTbN4SBae+8JarpYAsES7d41kX6dVmRGyjXwIuV//kqlk4mhQdqbFZ9wqdSdYTrKsnryfhrLAPeMjKnwbYu9gqi4Z2z7GhBVlN6c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from localhost.localdomain (unknown [116.25.95.187])
	by smtp.qiye.163.com (Hmail) with ESMTP id 37b41ebdf;
	Fri, 20 Mar 2026 18:40:31 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: huang.ze@linux.dev
Cc: amadeus@jmu.edu.cn,
	dlan@kernel.org,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-usb@vger.kernel.org,
	spacemit@lists.linux.dev,
	thinh.nguyen@synopsys.com
Subject: Re: [PATCH 1/1] usb: dwc3: dwc3-generic-plat: Add optional VBUS regulator support
Date: Fri, 20 Mar 2026 18:40:26 +0800
Message-Id: <20260320104026.1350571-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <DH7ILSL8DXBO.ZR74CL1QEUBU@linux.dev>
References: <DH7ILSL8DXBO.ZR74CL1QEUBU@linux.dev>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9d0ad51abb03a2kunm01e649021f45a3
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCGh9JVkpDT0JJHUlLGUxMHVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk5VSkNMWVdZFhoPEhUdFFlBWU9LSFVKS0lCTUtKVUpLS1VLWQ
	Y+

Hi,

> I think it's better to align the driver with the actual hardware. I'm not
> opposed to managing any regulators in usb host/device drivers. But if we
> do have an onboard hub, and regulator belongs to the downstream ports of
> the hub, then it's hub's job, right?

> Many boards leave gpio controlled regulators always on, that's what we
> want to solve. If we have to choose the parent of these regulators, why
> not put them in the correct hierarchy?

I think we can manage the regulator in the USB host driver first,
and then use it after the onboard_usb_dev driver has been merged.
This is better than keeping the regulator always on.

> If such a board really need the regulator, IMO, your patch is the way to go.
>
> OrangePi haven't released the schematic yet.
>
> That's what I could find [1], which seems similar to RV2.

There is no onboard USB hub. Just check the image:

http://www.orangepi.org/img/r2s/details/17.png
http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-R2S.html

Thanks,
Chukun
