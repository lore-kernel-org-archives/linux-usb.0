Received: from ultrarisc.com (unknown [218.76.62.146])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E1DF27EC7C;
	Fri, 26 Jun 2026 02:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.76.62.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782439714; cv=none; b=LfopM0mmwGqP2cvZgH8wzEMCHm3sI21Eaq54/YK4hmPG4GzuHMrj8dC/0Ay4bApdqe6kCQiC0+eihCN072UPFfxuNXzBd/9dmH5daXDTlB5EVEriGSeCS4Ogef7/TKHIYyE0DMKgBbstAI6Bsm0Yyn7EVdbVby9tO7Fyyr3zzjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782439714; c=relaxed/simple;
	bh=qNbtRz7nLKAusORC1Qz5etmiIDHSMhZuAn44R2UqKrc=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=r3iLNov6VsEzJ5cZ7MEb08ct0gP48kRd2IMOqfQ4luMDLItC9JIYcjsHAJvb+lhsNBG40J08osw2kNbO/hdvIVw7DF5PnLQISYtZ6bgoX1stWpqPytqAGNIWewZASGzL0Ik2Hmd5i+YDJ77znQzrM8TdVIJiEQl186/PZF6vVNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com; spf=pass smtp.mailfrom=ultrarisc.com; dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b=R+OXn9VF; arc=none smtp.client-ip=218.76.62.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b="R+OXn9VF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=59IpYbyxCMc43Z7q13ldEVcdPEiV7QygC
	8MlyT/S22k=; b=R+OXn9VF9vV9QtSnHrZ0JJ1jm4WW+iPGmDqCpqEW4GeJwd8d3
	UECq3QhdlIP3d9QGVbFaMzg4cMCqIdSdqcnYcDmygJR7XGjPMUeHh65An172C7su
	1lhjaCPN7n7Up+cLm32AxpfMb+zO38jpvOxPmvoptC11VmIkmFltRxBq8M=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwA3cUIv3z1qOCQNAA--.14491S2;
	Fri, 26 Jun 2026 10:08:47 +0800 (CST)
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
Cc: Xincheng Zhang <zhangxincheng@ultrarisc.com>, cyrozap@gmail.com, 
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, mathias.nyman@intel.com
In-Reply-To: <20260625191852.0a8d511c.michal.pecio@gmail.com>
References: <20260623121847.53749028.michal.pecio@gmail.com>
 <20260624070612.337013-1-zhangxincheng@ultrarisc.com>
 <20260625020421.2e577a94.michal.pecio@gmail.com>
 <178235378952.3114334.15752812276771065417.b4-reply@b4>
 <20260625191852.0a8d511c.michal.pecio@gmail.com>
Date: Fri, 26 Jun 2026 10:08:12 +0800
Message-Id: <178243969291.4163324.10940330394674148972.b4-reply@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782439693; l=1632;
 i=zhangxincheng@ultrarisc.com; s=20260624; h=from:subject:message-id;
 bh=qNbtRz7nLKAusORC1Qz5etmiIDHSMhZuAn44R2UqKrc=;
 b=eslWOYl6BSuHYLAk6T4Y13dZ1LrMwls6Sh3hs1/6wCo2WuFEnCPcmnmxNWcs0dCy3+elP3m45
 bOXtFcln0s1BDn1kOyk7BfyR0FAd3VUHtiWSAGztZBkszi1IOMHrU0e
X-Developer-Key: i=zhangxincheng@ultrarisc.com; a=ed25519;
 pk=QKwIEfHqvHrwmpA11qRt63ntQ3+BYBPSEvecshGYdOA=
X-CM-TRANSID:AQAAfwA3cUIv3z1qOCQNAA--.14491S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJr48Zr47WF43WF13Ww1DAwb_yoW8Wr1UpF
	W5KrZ5KFZ8Kr1rA3yF9w40qFn5XFZ3K3yUZ3Z2krn2vr13Wryq9Fy8KF1FyF4UC3WIq39F
	vF4Yyas7CFyDJaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUv214x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
	6r4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r1j6r
	4UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s
	026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_
	JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20x
	vEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE
	14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa
	7VUbSfO7UUUUU==
X-CM-SenderInfo: x2kd0wp0lquxxhqjq3powut2xlvfhudrp/1tbiAQAJDGo8pcwAIQAEse

Hi Michal,

On 2026-06-25 19:18 +0200, Michal Pecio wrote:
> Right, your addresses barely exceed the 36 bit limit. And I found why
> my chip behaved differently - 40 bit DMA was a firmware upgrade.
> 
> After downgrading my controller from 00013704 to 00013600 it truncates
> addresses to 36 bits and fails like yours. And it's a pretty nasty bug,
> because some of those accesses are writes to scratchpad buffers, so
> without IOMMU the chip corrupts unrelated memory below 64GB.

Thanks a lot for checking this on your side.

> You can check your FW version with this one-liner:
> lspci -d 1106:3483 -xxx | awk '/^50:/ { print "VL805 FW version: " $5 $4 $3 $2 }'
> 
> More about VL805 firmwares:
> https://github.com/jpmorrison/VL805

I checked the controller firmware on this machine:

  VL805 FW version: 00013600

So it matches the firmware version where you reproduced the 36-bit
truncation.

> One could ask whether 36 bits is low enough for all VL805, but I think
> it is because the bug is hard not to notice and nobody ever reported it
> on systems with less than 64 GB of RAM, even though 16 or 32 GB without
> IOMMU was a common option in DDR3 generation PCs, which is also about
> the era when this controller was introduced.

I agree. The scratchpad write corruption risk makes the conservative
limit especially important for no-IOMMU systems.

For v2 I changed the patch to avoid XHCI_NO_64BIT_SUPPORT. It now uses a
separate xHCI quirk for VL805/806 which sets the DMA mask and coherent
DMA mask to DMA_BIT_MASK(36), while leaving HCCPARAMS1.AC64 visible.

Regards,
Xincheng


