Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D99F37F73C;
	Tue, 21 Jul 2026 10:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784629821; cv=none; b=FjfaXBuTra3jun5PhvL7e6ML7EhuOOVBdhB5qNoroplE1SiM9ONRfg4QrjzQjIul1cRjcIFMPQdsfqgJTArsPOQNho0VQtlD8d9KPVrjIiCwIIze7p7eFFgUcQyiL4hylDBrAVax2DbO3SqFxhFr64jgToHWQnzFtofQlyHLh7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784629821; c=relaxed/simple;
	bh=7YCf7lDVTNM2Cks2dHnxB1xZNybjnApy/5E+o1hPbjA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PV9Vra1yKhVrYSem+Tvlv7dJNzhp+TZzwb3Sgyhftib7JgBmbxU9CLxhEBWna2wU5QzaTlfeM5sz21HVxdP2mT1AsGFfcFa5bqH0/tLNriugmFjvpFFNCs9yM14ptdluhzvdfIHdkTdh3TKA/fjtRk6hXKR/BTG872WfDOyYdVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from Vostro-3710.lan (unknown [113.80.141.224])
	by smtp.qiye.163.com (Hmail) with ESMTP id 47005d487;
	Tue, 21 Jul 2026 18:30:06 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: johan@kernel.org
Cc: amadeus@jmu.edu.cn,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/1] USB: serial: option: add TDTECH MT5710-CN
Date: Tue, 21 Jul 2026 18:30:00 +0800
Message-Id: <20260721103000.3721570-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <al4tjkfe3b9C9xSQ@hovoldconsulting.com>
References: <al4tjkfe3b9C9xSQ@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9f8439c3b403a2kunm24ce2447126e8b
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaQx0eVk9JSEoYSUJDTx4eTlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKSkhVQ0tVSk9KVUlJT1lXWRYaDxIVHRRZQVlPS0hVQkJJTk
	tVSktLVUpCS0JZBg++

Hi,

> Do you know which chipset these devices are based on?

It is based on the Huawei HiSilicon Balong chip.

> Do all interfaces need (and accept) the
> USB_CDC_REQ_SET_CONTROL_LINE_STATE request sent on open
> (unless suppressed with NCTRL())?

Sorry, I don't know. Is there any way to verify this?

Thanks,
Chukun
