Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD30368263;
	Sat, 22 Aug 2026 20:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787428891; cv=none; b=iNUlnDK+a1Y4tJgLds2RoyKW27hMX4v6/I3PZh23vsi1y0WO/pa5aqcCpmDUu14aPsKOVnxbagC7/CCViKwQIjC/APJpD8gi6k1/jE9GOzbGp/wjaY7pArV/guRB5L2pMeV8RxJB1RjWQgiBWXxYo5207N1rIWmmMSDk9vmGvCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787428891; c=relaxed/simple;
	bh=4w2TKp3z3xfToHE6p+N0VHmScZDsashSRE/FsEMIaSE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mBWhlSr3MFpZaXiX+9mXQggo4IzP4b0E52W+h6VnUnOjAMF/6l6quHHkmvLA7sGuxjhbVo84DTtk/patDYg3Ll8APHyxjgMnTAnRpCC+7VQ4T7X/PAV+8IK8/ViYQKoWz2WxbUhyCIghQrJ7F9dIDhjSznAxNF5VPg/rhS9hD5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=b/cJBHEt; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="b/cJBHEt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=n4ShKP9zyoA3Kx+vFqTOd8FRYE2qHo6HeEdDzOzbmTY=; b=b/cJBHEtD36dClLtkdbttCMsHI
	JbQPu5F1Gxq7ky0MTzTUIlmg2rCPorn7+f6VXsi7H+OXW0cwLJIfVA2iIBwKegtqjOrli7HzaEwi4
	ZI12bHj4KW+Mxy0368XWM7juJXW35C9ueIi7a1HJnLutl646YVF0TfbQrd/fN5JHLSFEp2MolT0Zh
	iA625ynoqQWWG+VNo5FaJAlDrQwXa9RVHBuN9gejkcicZsYkL/zuUg46ru7pPE7BdMEP0F4YcyY/h
	NqHQsLBM0Ra89zcgSpxVFFDH6aAgTM+W0SrMpOZspUpi/Vjfr5Mo67Dj1oeNPc6MkvC1u2OEDqh4p
	J1u3LGfQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxru4-0000000Elco-0Zix;
	Sat, 22 Aug 2026 20:01:20 +0000
Message-ID: <bccf64d8-d7f2-46e9-b3e2-5605decad9d6@infradead.org>
Date: Sat, 22 Aug 2026 13:01:19 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: gadget: f_uvc: fix Extension Unit descriptor heap
 overflow
To: Haofeng Li <lihaofeng@kylinos.cn>, gregkh@linuxfoundation.org,
 xu.yang_2@nxp.com
Cc: hhhuuu@google.com, kees@kernel.org, kai.aizen.dev@gmail.com,
 andriy.shevchenko@intel.com, christophe.jaillet@wanadoo.fr,
 dan.scally@ideasonboard.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, 13266079573@163.com
References: <20260822194705.4151650-1-lihaofeng@kylinos.cn>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260822194705.4151650-1-lihaofeng@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/22/26 12:47 PM, Haofeng Li wrote:
> +/* The descriptor must fit into the one-byte bLength field */

          descriptor length must fit
?

> +static int uvcg_extension_check_size(u8 nr_in_pins, u8 control_size)
> +{
> +	if (UVC_DT_EXTENSION_UNIT_SIZE(nr_in_pins, control_size) > 255)
> +		return -EINVAL;
> +
> +	return 0;
> +}

-- 
~Randy

