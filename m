Received: from ultrarisc.com (unknown [218.76.62.146])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6AB53D902D;
	Mon, 29 Jun 2026 07:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.76.62.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782718139; cv=none; b=Gmy61L9iVqBs30M98PU2AVQ8Lx0xCadGRXGK6zCaq+VmzcZQUAGjRNbJYtoGTZMoCrgPzcuM3iVU239CVpP5cKqyH/wvA+63+8dHQcxYEG9lKlhgolFmtKtfS4UZYZUfWe6LLhXobG+WQ1WdTwEynTeCGZyvxJdmSwlYTo8NXGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782718139; c=relaxed/simple;
	bh=ZENJ3f5Ea3Zb1Uy2qs2eMFlAH3pKho6umsOMXtZokL4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Js/e3pR3zA14jb/n9plYmVDyQew86afSppU8SRB1AzM1+OH21qhKddMQpc0t/qx0MLEEjNFmckkeWlhLhplhxmVN38d8yIQdcZGK+3xcM21Vzz3eg0sC7qRRCCD1lGcAbfPSToLCNOChfU9S6nMyjes4cfiLBbaNwrrKluposog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com; spf=none smtp.mailfrom=ultrarisc.com; dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b=PsbNgNIC; arc=none smtp.client-ip=218.76.62.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b="PsbNgNIC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-Id:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=ZENJ3f5Ea3Zb1Uy2qs2eMFlAH3pKho6ums
	OMXtZokL4=; b=PsbNgNICLzqYg68xXx4GAoDUhNNoekOxxd1YDex00mqqZv1MFN
	kbu1Q85N0GrSYt8VOpZMKHXSqzwDrUIQ2yLLT/3KH3OHPrWLpcwC1mLN6hwcZOii
	se1AE9vV39cGsWoLs9QAJ52/VGeB7AAi4kCX9m6anAzYq5KJ3jTQMHpQk=
Received: from leopard.. (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwAnEkPUHkJqxOsNAA--.14725S2;
	Mon, 29 Jun 2026 15:29:24 +0800 (CST)
From: Xincheng Zhang <zhangxincheng@ultrarisc.com>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Forest Crossman <cyrozap@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: xhci-pci: Limit VIA VL805 DMA addressing to 36 bits
Date: Mon, 29 Jun 2026 15:28:12 +0800
Message-Id: <20260629072812.1410424-1-zhangxincheng@ultrarisc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260629070906.37320541.michal.pecio@gmail.com>
References: <20260629-xhci-via-dma-fix-v2-1-380167319652@ultrarisc.com> <20260629070906.37320541.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAfwAnEkPUHkJqxOsNAA--.14725S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZryxJryktF48XFWxCw48Zwb_yoW8WFy7pF
	Wagw1xtr4vkryIkFnIka10va4Fywnay3s8tr95Ka4Y9w15GF9Fgr4xXw4Yva4DArs7Zw42
	q3yjqr9xurZ8JaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUva14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
	6r4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2
	IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v2
	6r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2
	IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv
	67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyT
	uYvjfUYCJmUUUUU
X-CM-SenderInfo: x2kd0wp0lquxxhqjq3powut2xlvfhudrp/1tbiAQANDGpB680AEgAAsf

Hi Michal,

On Mon, Jun 29, 2026 at 07:09:06AM +0200, Michal Pecio wrote:
> This may turn into multiple quirks differing only in the number at the
> end. For example, ASMedia chips appear to be limited to 48 bits and we
> don't even know if these two are the only bad vendors. I briefly tested
> Etron and NEC/Renesas, they seem to be OK, but there are others.
>
> The driver is getting dangerously close to filling quirks bitmap and
> needing changes to support more than 64 quirks.
>
> Alternatively, I think your 'dma_bits' variable could be allocated at
> the beginning and initialized to 64, then passed by reference to
> get_quirks() so it can tweak it, and lastly clamped to 32 if the AC64
> capability is absent or disabled by quirk.

Thanks, this makes sense.

I reworked v3 to avoid consuming a new xHCI quirk bit for each possible
DMA address width. Instead, struct xhci_hcd now has a generic
dma_mask_bits field. xhci_gen_setup() initializes it to 64 before
calling get_quirks(), and the VIA VL805/806 PCI quirk sets it to 36.

The DMA mask setup then uses DMA_BIT_MASK(xhci->dma_mask_bits), while
still preserving HCCPARAMS1.AC64 for VL805/806.

> I'm not sure if we really need this second call to dma_set_mask() below
> when the first call fails? This code was added by fda182d80a0bf and it
> really should have been an 'else' to the check for AC64 capbality, not
> to the capability *and* having successfully enabled 64 bit DMA.
>
> OTOH, one could argue against cleaning this up in a stable patch.

I left the existing 32-bit fallback behavior unchanged in v3, since this
patch is intended to stay narrowly scoped for stable.

Thanks,
Xincheng

