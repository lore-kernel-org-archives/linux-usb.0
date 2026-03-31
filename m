Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29ED3E3D84;
	Tue, 31 Mar 2026 13:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774962169; cv=none; b=jRnl2k2Nh6MS8HmQK12+fCSKRGEQn9WhGvzaBj7bmllFsbqQvGbHq5arw+Tqe/mxWEGftMG9orl/D/e4C2hygaZ59v3+Q4W3UNQFv2+pGD2DaHoII7v1CFJ6ahEbkHeHaKbG1J9yvhif5U8XOXNJ9q5I4JYRwFWmLTtmfxazALE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774962169; c=relaxed/simple;
	bh=4AaSHDyqLaB2+JhX660/Yt1rabMjTe6WBX7beaOccNw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=udvFd2G9Y28Hmmu7+sCLZ1HVg3nrRYwZySi7sdMHqOhGrch/6o4964kos/NkTbijR99jLn/tuhCfE3A0QkaUIQ42D55od5Dl6kDMrjv3YBjHp0F4braSqPe4I10VsNGTVVPd71PEPBHuIRY7Qv55UtRog9j+x95EXKLb4ppGeGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from localhost.localdomain (unknown [116.25.95.185])
	by smtp.qiye.163.com (Hmail) with ESMTP id 390013f6b;
	Tue, 31 Mar 2026 21:02:37 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: troy.mitchell@linux.spacemit.com
Cc: Thinh.Nguyen@synopsys.com,
	amadeus@jmu.edu.cn,
	dlan@kernel.org,
	gregkh@linuxfoundation.org,
	huang.ze@linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-usb@vger.kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v3 1/1] usb: dwc3: Add optional VBUS regulator support to SpacemiT K1
Date: Tue, 31 Mar 2026 21:02:30 +0800
Message-Id: <20260331130230.2913628-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <5E6BDCE16DD4ADB0+acuJBfKF-SCAOu2_@kernel.org>
References: <5E6BDCE16DD4ADB0+acuJBfKF-SCAOu2_@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9d43fd26cc03a2kunm424ea1324c937d
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaGU1MVkIYGUNNQ0lNSk4YGVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk5VSkNOWVdZFhoPEhUdFFlBWU9LSFVKS0lCTUtKVUpLS1VLWQ
	Y+

Hi,

> > +	if (usb_get_dr_mode(dev) == USB_DR_MODE_HOST) {
> The logic looks good, but the structure can be further improved to better align with
> standard kernel coding style:
>
> if (usb_get_dr_mode(dev) != USB_DR_MODE_HOST)
>   return 0;

I initially thought of writing it this way too.

> > +		int ret = devm_regulator_get_enable_optional(dev, "vbus");
> Could you please move the declaration of ret to the top of the function?

Thank you for your suggestion. This patch has been merged.
Perhaps it can be revised in the future.

Thanks,
Chukun
