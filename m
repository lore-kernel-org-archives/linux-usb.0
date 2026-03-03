Received: from mail-m32124.qiye.163.com (mail-m32124.qiye.163.com [220.197.32.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5D033C53A;
	Tue,  3 Mar 2026 11:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772538999; cv=none; b=NUGxnEuobRdvMu9Aqslqr9h2+2WgfgS6QEA1G7Q6bT4qEu8oeIyjewJbaexf6phi5qH2UDMAoMO9feu7k1WHf8hgnQmvDnlLTDIBSj349Aw1cJE2GzZZFI1sdl8UmzA1amH2Ulmi6L1fStECj/KVG6s6emf34EvwW9CllmXbXXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772538999; c=relaxed/simple;
	bh=SyqIbHM8aYosfnevBVq5CkMExkOZcqZOdFPhjtX8BWU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lizwfcBQNs3gV19GJW0cr4UL0sO2c3jSeVaT/9omGliSD8wXiWA5Jm+B2lVH8xt+K9VgneSZYmxC0PHbyoTwHqB8adpCGKSv/pIG9BjcPDa7znYMCSCaz05KvIm74FoCoKGuv7M3jDcuHsG8jT+R49Qd+bLJIzB+jDdThq4otfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=ZT+Y1YEg; arc=none smtp.client-ip=220.197.32.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="ZT+Y1YEg"
Received: from localhost (unknown [222.130.22.244])
	by smtp.qiye.163.com (Hmail) with ESMTP id 35979e383;
	Tue, 3 Mar 2026 19:41:08 +0800 (GMT+08:00)
Date: Tue, 3 Mar 2026 19:41:05 +0800
From: BaiKefan <baikefan@leap-io-kernel.com>
To: si.yanteng@linux.dev, seakeel@gmail.com
Cc: linux-usb@vger.kernel.org, alexs@kernel.org, dzm91@hust.edu.cn,
 corbet@lwn.net, linux-doc@vger.kernel.org, doubled@leap-io-kernel.com
Subject: Re: [PATCH v5 0/8] Add Chinese translation for USB subsystem
Message-ID: <20260303194105.00004696@leap-io-kernel.com>
In-Reply-To: <cover.1765180570.git.baikefan@leap-io-kernel.com>
References: <cover.1765180570.git.baikefan@leap-io-kernel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9cb3807f8509d5kunm56864188b56e57
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCTkIaVh8YSRlJGktJSR1CQ1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlJSUlVSkhLVUlJVUlPT1lXWRYaDxIVHRRZQVlPS0hVSktISk5MSVVKS0
	tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=ZT+Y1YEgh8EsbngBkNJxjrEVYU/HzRnQpfDGIgkAeRwrtOIyleo7NDiuq3mpgI/DplWFhQBOzU2yIAYtsOR1aBrgxS2qwBmNa+3HjSkHwBAMqngeovUNs9bfdXLUT2UE3tiILQz8sMxppT7gt5Z01vgqx5qy/fbO20Fk/K40rK4KKooQLkoxA+O6JkCZekvFcKWf/AgnGo3uOp9RFk00XSblYg1nzZCxYXg32M1hFq6Q2QXWSdLqKfrS6G+Wikduhoa39+YrWgLvB5bp29JyIZB22Aq8ychcf01Am4xMzbl3/0psrKohO1dzaOMyX8TzDJsnKGRkEVvsdxQZc8JK1Q==; c=relaxed/relaxed; s=default; d=leap-io-kernel.com; v=1;
	bh=DqHwu/DaLy1ZvOsiGkbWdbgMUVttdNMR6+KD5aqpmrc=;
	h=date:mime-version:subject:message-id:from;

Hi Yanteng and Alexs, 

A few months ago, I submitted a patch for the Chinese translation of
the USB documentation. 

Following your suggestion, I forwarded it to the USB subsystem
maintainer for further review, but I haven’t received any response yet.

Could you please advise on the next steps? Should I follow up with the
maintainer, or is there another recommended approach to help move this
patch forward? 

Thank you for your assistance! 

Best regards, 
Kefan



On Mon,  8 Dec 2025 17:25:30 +0800
Kefan Bai <baikefan@leap-io-kernel.com> wrote:

> This patch set adds Chinese translations for the USB documentation.
> 
> Changes in v5:
>  - Ensuring that the index.rst entries, including acm, authorization,
>    chipidea, dwc3, ehci, and usbmon, are placed in the correct patches
>    to prevent build errors when patches are applied individually.
>  - Remove extra spaces in chipidea.rst.
>  - Send these translation patches to linux-usb@vger.kernel.org for
> review by Chinese-speaking developers, per Alex and Yanteng's
> recommendation.
> 
> Changes in v4:
>  - shorten those overlong title underline/overline symbols
>  - Remove CREDITS section from index.rst
>  - Link to v4:
> https://lore.kernel.org/all/cover.1764674650.git.baikefan@leap-io-kernel.com/
> 
> Changes in v3:
>  - Updated the signoff to my full legal name,
>    as requested by Jonathan Corbet.
>  - Reviewed and fixed the RST syntax to resolve the patch issues
>    noted by Alex Shi.
>  - Kept the number of translated files to eight
>    to make submission and review smoother.
>  - Link to v3:
> https://lore.kernel.org/all/cover.1763984424.git.baikefan@leap-io-kernel.com/
> 
> Changes in v2:
>  - Update [PATCH 01/25] docs/zh_CN: Add index.rst translation
>    to include corresponding updates in
>    Documentation/translations/zh_CN/subsystem-apis.rst.
>  - Link to v2:
> https://lore.kernel.org/all/cover.1763897036.git.baikefan@leap-io-kernel.com/
> 
> v1:
>  - Link:
> https://lore.kernel.org/all/20251123074540.34161-1-baikefan@leap-io-kernel.com/
> 
> Kefan Bai (8):
>   docs/zh_CN: Add index.rst translation
>   docs/zh_CN: Add acm.rst translation
>   docs/zh_CN: Add authorization.rst translation
>   docs/zh_CN: Add chipidea.rst translation
>   docs/zh_CN: Add dwc3.rst translation
>   docs/zh_CN: Add ehci.rst translation
>   docs/zh_CN: Add usbmon.rst translation
>   docs/zh_CN: Add CREDITS translation
> 
>  .../translations/zh_CN/subsystem-apis.rst     |   2 +-
>  Documentation/translations/zh_CN/usb/CREDITS  | 153 +++++++
>  Documentation/translations/zh_CN/usb/acm.rst  | 137 +++++++
>  .../translations/zh_CN/usb/authorization.rst  | 125 ++++++
>  .../translations/zh_CN/usb/chipidea.rst       | 142 +++++++
>  Documentation/translations/zh_CN/usb/dwc3.rst |  60 +++
>  Documentation/translations/zh_CN/usb/ehci.rst | 216 ++++++++++
>  .../translations/zh_CN/usb/index.rst          |  54 +++
>  .../translations/zh_CN/usb/usbmon.rst         | 380
> ++++++++++++++++++ 9 files changed, 1268 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/usb/CREDITS
>  create mode 100644 Documentation/translations/zh_CN/usb/acm.rst
>  create mode 100644
> Documentation/translations/zh_CN/usb/authorization.rst create mode
> 100644 Documentation/translations/zh_CN/usb/chipidea.rst create mode
> 100644 Documentation/translations/zh_CN/usb/dwc3.rst create mode
> 100644 Documentation/translations/zh_CN/usb/ehci.rst create mode
> 100644 Documentation/translations/zh_CN/usb/index.rst create mode
> 100644 Documentation/translations/zh_CN/usb/usbmon.rst
> 
> --
> 2.52.0
> 
> 
> 

