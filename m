Received: from ultrarisc.com (unknown [218.76.62.146])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C8655478D;
	Wed, 24 Jun 2026 05:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.76.62.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782278782; cv=none; b=uGHJvnyFvqaMfQCDCGgleyc3gEsXu2kCAB4CSPlhqYpEVXLNicvM5Jhj+mHonjKWfoNHcuXsqWo/o204FZ+qV6jFK0IrxwHhwZ8jNyxglI6GvEp5t7Zhja2MybkOv/GRcUZBikIOPLnNhwflGRLaLCQANQN/uzkMyVH9cuZRmQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782278782; c=relaxed/simple;
	bh=8Cd6+H4RNiHdWqEe1lDMeUgukwCB0rSDBxzZjoK1EPA=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=jJi9F0kvVa7uNU805AMa8DN7f6cn4M1x4NOYBhcixgP+vw+emLpaJdwoV5uXviHSrkKJiqrP8+taZiJAPzeMrhwdGzswZKSpub8wujqXKC0DgfTz1PGiLuU47dt2sgvPS4U2gNHNp8pJ7I7jxQ8YGACnwg4wEtW0Go4HqTv5kSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com; spf=pass smtp.mailfrom=ultrarisc.com; dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b=a+FYiRht; arc=none smtp.client-ip=218.76.62.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b="a+FYiRht"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=/NLBZOYNCStta42wBbvRH4yHB25JbGFVy
	Ety1z8J4hE=; b=a+FYiRhtEjKiqjrCHBFrhGq+rSZkNSxM2Qp08IldfQDWVU3/f
	z1KGkntgewPIworg/7Gv7pedfY3w/CLP9cbBBtqM+E7Dxr/sUvqiH/vOQ/KV0LRW
	Oc9hdfXIBfW69aZ2W6DaNo4+arqi2E9XAcyHS1f98krHmFn4ht1gXmtoBc=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwDXEEKZajtqv7oMAA--.14085S2;
	Wed, 24 Jun 2026 13:26:49 +0800 (CST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] usb: xhci-pci: Disable 64-bit DMA for VIA VL805
From: Xincheng Zhang <zhangxincheng@ultrarisc.com>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Xincheng Zhang <zhangxincheng@ultrarisc.com>, 
 Mathias Nyman <mathias.nyman@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Forest Crossman <cyrozap@gmail.com>
In-Reply-To: <20260623121847.53749028.michal.pecio@gmail.com>
References: <20260623-xhci-via-dma-fix-v1-1-3f12c81a1cf8@ultrarisc.com>
 <20260623121847.53749028.michal.pecio@gmail.com>
Date: Wed, 24 Jun 2026 13:26:14 +0800
Message-Id: <178227877476.3699479.5394120322900121995.b4-reply@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782278775; l=711;
 i=zhangxincheng@ultrarisc.com; s=20260624; h=from:subject:message-id;
 bh=8Cd6+H4RNiHdWqEe1lDMeUgukwCB0rSDBxzZjoK1EPA=;
 b=GIIWFEM1Oga7O7q7iC/kMH02V/tPDSxs4xnn7nsNfmMFZ2PYbKbCXEW1iJu4cPleQWbEmHiVw
 hL4j5vuC6BeBzFqgx5KyjzpIrPo1XAVFcSdG2M/8+0YvEe10iRfJfZo
X-Developer-Key: i=zhangxincheng@ultrarisc.com; a=ed25519;
 pk=QKwIEfHqvHrwmpA11qRt63ntQ3+BYBPSEvecshGYdOA=
X-CM-TRANSID:AQAAfwDXEEKZajtqv7oMAA--.14085S2
X-Coremail-Antispam: 1UD129KBjvdXoW7JF4UXFWkGF4fuF1xWFWktFb_yoWxZFcE93
	4kuFZrKayDXF47Ar4kXr1Ygws7Krs7WFyUXrW0qws5t34rZwsxXw4jg3s5ZF12yayftFya
	g3s8t3yIk3yagjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbIxFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Jr0_
	Gr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr
	1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s
	026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_
	JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20x
	vEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE
	14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa
	7VUbPl1PUUUUU==
X-CM-SenderInfo: x2kd0wp0lquxxhqjq3powut2xlvfhudrp/1tbiAQAIDGo7VEwAAwAAsP

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


