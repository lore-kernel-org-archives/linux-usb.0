Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795010949;
	b=JBcSZ+ujX+IcKUK4DdbvARPPw13IJnU6SS/zAzNZlFhtZEkAIFEd0Co/0sHx9Rgnm9GA
	 hZZ60ClJGS8nsxHzbtlgOAKhd8DCi6N0NGjXodHpEAEQ5/vojDZVijjAWKUGTkcZ1zahe
	 FnQFSeRhWtJIQi8JXcZuJTa0wfC3Pvz1/HiQ7+yrVYOcYaBFpHyMZBOqJn81089cucZTH
	 wPw9jO5h/FvEYSrUMYDqfKZ6TFwqkrxPL99u+fQQ63YaegLjA48qt5tMDDAULu5SyuRCM
	 tUosE4fLWtnbaczbUQonhrBplUhM1Wco1EmVYmrrZhJaw9bkSMy62KtRONf6bKGwkuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795010949;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-HM-Tid:
	 X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=1gDHZMUCCewryu/nDd6CsJfzmb7PXvi882IklzMUwSE=;
	b=FkJa6ckeOIHajFJGTru3pOR3LKbOxUcq5H6o/9Y6HckcLsRZafZNk6a8xMTlaezB0RK3
	 BhSIY/M+YdM8WVt5OcETQ7D7IPmNZB9cKFLlJEWSx1/fo100GDSxGLorY6yA56JUOuNse
	 Y2tc84I+ALcZnw6w5KGYgPc0ZAMIHu3JGa1jdNBfcobXbzPoSMfafMo1j4hhhSDp7Ez3K
	 D2vkKRAZHVEy0B4ZEfhhe7k0W4CemXAhTinFMaaXLN/rBX+O6a7yV7+BBjt32OAbW3cY2
	 q7g9wHJrC1qdsf13Z5gNqYGdKCuR/o187KWr0XI2RbdtO/HRW+NKwp7hEyH7ZB2Dskg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=Nu9xI0eI;
	arc=none smtp.remote-ip=45.254.49.197
Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03FA60A2623;
	Wed, 18 Nov 2026 14:09:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D03FA60A2623
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=Nu9xI0eI
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5526d77c8;
	Wed, 18 Nov 2026 22:08:59 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: Neill Kapron <nkapron@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/2] usb: gadget: Correct cleanup ordering on failure and removal
Date: Wed, 18 Nov 2026 22:08:59 +0800
Message-ID: <20261118-324f82bd41-usb-gadget-0@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1eefd4bc503a1kunm567c06bc1a093d
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCGU1PVk8eHx0aHRkeSx5NQ1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=Nu9xI0eIMxZMfpmfnThgph1YQz1bvoH9LRP3ku4c0o6nm1Y2a+c/f0vmK2eAKT9zvZ4V1I64FQpIRR4Pms5iKBDIK0yMODnoU+R7yFFmJrOWFPjlxwya+VruwsNZbIT3Sy+0fmmlDXUZ5DdvFew29sRlyoWbRYBdC8/rly7DPK0=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=1gDHZMUCCewryu/nDd6CsJfzmb7PXvi882IklzMUwSE=;
	h=date:mime-version:subject:message-id:from;

Keep the FSL controller alive through removal and detach the Nokia
functions from their configuration before dropping their references.

Guangshuo Li (2):
  usb: gadget: fsl_udc: Fix potential use-after-free during removal
  usb: gadget: nokia: Fix potential use-after-free on bind failure

 drivers/usb/gadget/legacy/nokia.c     | 4 ++++
 drivers/usb/gadget/udc/fsl_udc_core.c | 2 ++
 2 files changed, 6 insertions(+)

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

