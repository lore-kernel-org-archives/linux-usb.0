Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7ED3DEAD7;
	Tue, 24 Mar 2026 13:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774357369; cv=none; b=ha9BGLoXaib6SLEjUn3IxsOB3NkACz9apygRqPNgLEZpUEnZVkN97OKPIgMUJVgTnDrrdzjJM9XiIMUjqYY60XaiVo5VO0+oKJ7AOKERCdVNYEaM9xlm/12LAp7t+i6mL7F5W46hVvlvP9H4NPkaVD8oUk7LCuopp4V66rflFlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774357369; c=relaxed/simple;
	bh=xZ4IcRo4e2msS6ajq65WBz+8GNWxBRGQ6jlRGDrplaY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=maAy/6T7H/le3i/asouJO4PlPKTV5AMvNMH4N9ykg3mkmJkNWuabSQlMSW+7NflTszuEubrYvqPw9fkn9Sn/VeMkLBTWzAjpDjCB3ibEZO3aX08er2kcgEgFj47ws91laYTW3gE/OWqrRni4Zc85AuJnIEg63sFHHvR5mYWOUhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from Vostro-3710.lan (unknown [116.25.95.101])
	by smtp.qiye.163.com (Hmail) with ESMTP id 381dc3069;
	Tue, 24 Mar 2026 21:02:36 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: thinh.nguyen@synopsys.com
Cc: amadeus@jmu.edu.cn,
	dlan@kernel.org,
	gregkh@linuxfoundation.org,
	huang.ze@linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-usb@vger.kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v2 1/1] usb: dwc3: Add optional VBUS regulator support to SpacemiT K1
Date: Tue, 24 Mar 2026 21:02:28 +0800
Message-Id: <20260324130228.2913662-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260324014144.yq7s46fmo5gx72ym@synopsys.com>
References: <20260324014144.yq7s46fmo5gx72ym@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9d1ff09f9903a2kunmd38b0164305f11
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDSRpNVk9CSExLSRhISk1JQlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk5VSktKWVdZFhoPEhUdFFlBWU9LSFVKS0lCTUtKVUpLS1VLWQ
	Y+

Hi,

> Set .properties = DWC3_DEFAULT_PROPERTIES,

I missed it. I'll add it in the next patch.

> Any reason for moving this to the bottom? To avoid cherry-pick/rebase
> conflict in the future, can we place this where it was before?

Sure, I'll move it back to the original place.

Thanks,
Chukun
