Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430CA28469A;
	Fri, 20 Mar 2026 08:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773994728; cv=none; b=msmOitu3hovtUuZV7d700L7VEAncYD/jNLUapjGPr8hxW8g+MN0gZytCM/wfz7SlgImT0v3yVaTzGFwM9TzdZxBWVn80h7ATGq893lU//vDdnjE6Vt+1A+wfUFUCaOV93zpYEgWVLyBTTSnUIrs/iBVOl/UHWqBO4EyvUc9+ne8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773994728; c=relaxed/simple;
	bh=a2OoJkZZufYkGmEyA+/iYdYs7U/V+pVuRk+BzsDfpjc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AsNx3yz8VmAAOy7MRm26iJ3sMoR1vQzrr2UsMhc3s6sIZjeXZPh3aFdd+RJ/4Fk//+McS+lqUvbfhNlCYxdjWLly78bdIkcAAtTdgadU8UE6K8XwHZY+xf5OYlwPsBqKa6ODhHJlZZhwk4+xTmMGT2Jqdk8zPBR9wmz2j33HXwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from localhost.localdomain (unknown [116.25.95.187])
	by smtp.qiye.163.com (Hmail) with ESMTP id 37af264a3;
	Fri, 20 Mar 2026 16:18:40 +0800 (GMT+08:00)
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
Date: Fri, 20 Mar 2026 16:18:26 +0800
Message-Id: <20260320081826.1331721-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <DH7FXPBMB1K5.28IT6DZQ280ZV@linux.dev>
References: <DH7FXPBMB1K5.28IT6DZQ280ZV@linux.dev>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9d0a533c0c03a2kunm66181b331edc28
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCHUJPVkJOS09JSk1LTUsaGFYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk5VSkNMWVdZFhoPEhUdFFlBWU9LSFVKS0lCTUtKVUpLS1VLWQ
	Y+

Hi,

> I don't think it's a good idea to tie this optional VBUS regulator
> implementation to the SpacemiT K1 platform.
>
> While the K1 SoC does have a DRD controller, current boards in the wild
> (like Jupiter[1], OrangePi RV2[2], and Banana Pi F3[3]) all route this
> port to an onboard hub[4][5]. IMHO, managing the downstream VBUS regulator
> via the onboard_usb_dev driver is the correct approach for us.

I'm sorry, but I don't quite understand why it's necessary to use
onboard_usb_dev driver instead.

The DRD controller is connected to the onboard USB hub, so it can
only operate in host mode. If all downstream ports of the USB hub
use the same VBUS supply, then what's the problem with using this?

> K1 platform currently does not need this feature here.
>
> Considering the role switch, I think it would be better to hold off on
> this until there is an actual board/user that relies on it.

There is a board without onboard USB hub, such as the OrangePi R2S.
So this is possible for boards that don't have onboard USB hub?

Thanks,
Chukun
