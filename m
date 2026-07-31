Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BCD356747;
	Fri, 31 Jul 2026 05:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785477004; cv=none; b=lg6aTPx0Udd1q5qB6ocZrYya4OZQobNsO6lKI2lf2RBfKITPfqAKK8pCHqcho2aoTwGd1QswoVNbnR+kZnvJ9Gx6FcZ5jLe6uVMFAKojg8eKONow5r24wVHfzozF0UziBljJUSG5m/8Jv9fAoybCSwWJjTMgz6eJA5L2M8+FzIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785477004; c=relaxed/simple;
	bh=mSSlrcZYGq2mIKseVlqepT2QLi6IKxSUbT5hRwxP3Po=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qRx0LLCMLSa0hFzoUnTTweYK4Dbu+xMmd7x1ajDc9Ar/YDXd2jTkFyp7rkBgGZ7Zc2INtXzEomBeLbYYD8CIT9Yd4R/gYywRjnEH/v0ut1fySI8aWj1Ietji5Qb32la6ZrgsaA5GAVkjI6GOemhsxVVJk5njpkJXDsK18TAPFs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=j425OOtZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="j425OOtZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D94941F000E9;
	Fri, 31 Jul 2026 05:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785477003;
	bh=5Yxivssoz1mWSol4ZMRAkF7lx9OYS+Qc4X0hQqceawg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=j425OOtZeyex/ZVO/0rjcF0U7H4DD5foDMY8hRpJAdDYzGs7Y3/YAi4g7Fb3MhD3Z
	 ZaWMpI0hdFQys6ois3m58cNHXb9rsJ6RHTKvlpELNnhTGI2ob9yX5wZM+O2nJ7E+T+
	 uWbZUUavYB9TPs3m9LM7njCesaPm5+vFxu/rR+Qw=
Date: Fri, 31 Jul 2026 07:49:48 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
Cc: Andre Eikmeyer <andre@negmaster.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] thunderbolt: Add device links for Apple T2 NHI
Message-ID: <2026073154-swoop-outer-70b3@gregkh>
References: <20260730223435.2874-1-atharvatiwarilinuxdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730223435.2874-1-atharvatiwarilinuxdev@gmail.com>

On Thu, Jul 30, 2026 at 06:34:33PM -0400, Atharva Tiwari wrote:
> Ice Lake Thunderbolt NHI That are only on T2 Macs. The NHI and its
> associated PCIe Root Ports all sit directly on the Root Complex
> with no upstream port. Identify the tunneled PCIe Root Ports by
> their PCI IDs and create device links back to the NHI so that
> PCIe tunnels can be re-established after sleep.
> 
> And on other Thunderbolt NHI's, like Titan Ridge, the default method
> is used to add device links.
> 
> Co-developed-by: Andre Eikmeyer <andre@negmaster.com>
> Signed-off-by: Andre Eikmeyer <andre@negmaster.com>
> 
> Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>

No blank line here please.

> 
> Changes in v6:
> - Used for_each_pci_bridge in Icelake section
> - Removed has_apple_t2_chip as its not required now

These "Changes in" go below the --- line, right?


> +	/* Identify the tunneled PCIe Root Ports by their PCI IDs
> +	 * on Macs with Icelake NHI's
> +	 * and create device links so that
> +	 * PCIe tunnels can be re-established after sleep.
> +	 */
> +	if (nhi->pdev->device == PCI_DEVICE_ID_INTEL_ICL_NHI0 ||
> +		nhi->pdev->device == PCI_DEVICE_ID_INTEL_ICL_NHI1) {
> +		const struct device_link *link;
> +
> +		for_each_pci_bridge(pdev, nhi->pdev->bus) {

How are you able to walk all pci bridges of a pci device without a lock?

> +			if (!pci_is_pcie(pdev) || pci_pcie_type(pdev) != PCI_EXP_TYPE_ROOT_PORT)
> +				continue;
> +
> +			switch (pdev->device) {
> +			case 0x8a1d:
> +			case 0x8a1f:
> +			case 0x8a21:
> +			case 0x8a23:

What are these numbers, shouldn't they be a define?

thanks,

greg k-h
