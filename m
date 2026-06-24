Received: from ultrarisc.com (unknown [218.76.62.146])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CCEF38B7B4;
	Wed, 24 Jun 2026 07:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.76.62.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782284813; cv=none; b=QAqBZquVQCWQIZ53g24F8sojjPRr3LKym3aqRGl9GbEsiw0rsEae0HYoMeROrWWE3nNNQuv/7xGec3XjuwEfOGOS6F1y2g+ZBaiyc2s9vYFonFOi9l6dtqXi9lyR94ccJgZb9p5znhhY2f6F/VF074y89e9/xnyFyhRgqurrXDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782284813; c=relaxed/simple;
	bh=8Cd6+H4RNiHdWqEe1lDMeUgukwCB0rSDBxzZjoK1EPA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Unr0Cy33+ohfQtwsUK+ZNKHESTW8JTsn2eTZGKCLeQaRRbgA3ZFdkOVZeJ5uIVR9gosf4d5p829bffmZtzvuA1tLIm/C95j7+/WojR7mUcqwI3LrHwEuRAwNXeoSG+qFK+ltordrSCq/AaxI4IomS4MwItWMoIn96hZG6Iyp4F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com; spf=none smtp.mailfrom=ultrarisc.com; dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b=pJswjbKe; arc=none smtp.client-ip=218.76.62.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b="pJswjbKe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-Id:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=/NLBZOYNCStta42wBbvRH4yHB25JbGFVyE
	ty1z8J4hE=; b=pJswjbKeC0O1CL2w3Cy0qnAfH3+fbX2ra6u3Wr64WHQ2DNG9Ca
	+utwQXFJd89vEIlimPtTy4vq3uQXLx31WnG7wfA6Zv4xZ3T5HVZlab2SiqUs9CjR
	AITNmxcQTYnP7PwW1Ice0bS37cinanu8NDEHa12ipB3Ocv8nCougv2Zcc=
Received: from leopard.. (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwA3cUIpgjtqJ78MAA--.14160S2;
	Wed, 24 Jun 2026 15:07:21 +0800 (CST)
From: Xincheng Zhang <zhangxincheng@ultrarisc.com>
To: michal.pecio@gmail.com
Cc: cyrozap@gmail.com,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	mathias.nyman@intel.com,
	zhangxincheng@ultrarisc.com
Subject: Re: [PATCH] usb: xhci-pci: Disable 64-bit DMA for VIA VL805
Date: Wed, 24 Jun 2026 15:06:12 +0800
Message-Id: <20260624070612.337013-1-zhangxincheng@ultrarisc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260623121847.53749028.michal.pecio@gmail.com>
References: <20260623121847.53749028.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAfwA3cUIpgjtqJ78MAA--.14160S2
X-Coremail-Antispam: 1UD129KBjvdXoW7JF4UXFWkGF4fuF1xWFWktFb_yoWxZFcE93
	4kuFZrKayDXF47Ar4kXr1Ygws7Krs7WFyUXrW0qws5t34rZwsxXw4jg3s5ZF12yayftFya
	g3s8t3yIk3yagjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbIkFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Jr0_
	Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr
	1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s
	026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_
	JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20x
	vEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE
	14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf
	9x0JUBVbkUUUUU=
X-CM-SenderInfo: x2kd0wp0lquxxhqjq3powut2xlvfhudrp/1tbiAQAIDGo7VEwABAABsJ

Hi Michal,

On 2026-06-23 12:18 +0200, Michal Pecio wrote:
> But I don't like this abuse of the quirk. Firstly, it causes
> unnecessary bouncing on systems with >4GB RAM and no IOMMU.
> I found other drivers that use DMA_BIT_MASK(36) or even weirder
> numbers, so it seems that we too could request 64 gigs exactly
> with a bit of driver refactoring.

Thanks for the review. I totally agree that using `DMA_BIT_MASK(36)` is
a much better approach to avoid bounce buffers and register width issues. 

I will prepare a v2 patch with this refactoring. I'll wait a bit for
Forest's input on the ASMedia chips before sending it out, just in case 
we need to handle them together.

Thanks,
Xincheng

