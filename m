Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90E33B7752;
	Wed, 17 Jun 2026 13:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781701984; cv=none; b=l+Vyv2zXLC1/pALXJQJiZmcRtPX0YenUwNC97Jia579/grzpFZdARdYuvtKs0NsJUBg2acuGS8QKCl8mAcBIQP1HSezxwo55RGjbJQ+xUjrIWMaAt8Vao7s6eq3S/Icj5Q25Er78y2pAsRcHxW/LuH4pQYIjpcbtkLRbSFTT3MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781701984; c=relaxed/simple;
	bh=mktxY6+8TOqJcB9xZ++X392N7Pmb9mTQKs5RtIQUDwM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r503wA2uOeA3/lGzQk1HaeJ/vkql07IxqTCX/7nx2MeDXJCFPEgWHvbjN0x0gAsT8Svdg6b9YbW8Mfp+g3Db4AoMLEJV+z6JZCO047lUUQmxrTiiSBjVXILCBUAFGSmZG/laomHpFKJ268wErDQtSKh6ZWX8Qbtuf4VZFYQfFXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=jRQysM1A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jRQysM1A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F377A1F000E9;
	Wed, 17 Jun 2026 13:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781701983;
	bh=E74EG2XmukX2PDki5u3oBm3XlY01ky3medxFPAAgoY8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jRQysM1AyIaTCK7IIxXE6HqCGYF3aOydQx44AiMZftgMAfaVtad9kLxZan/wJMS8u
	 9D5uRt1WYQWZ0woqvgpZbdikf4Xj8/L4wiy76LBfmYMPLyXDv2AJpEdaJDeJBNdo9k
	 hiruZgqkWcAinhEYvOMvxrvMXAyL3kUYj1zk6sug=
Date: Wed, 17 Jun 2026 18:41:47 +0530
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Maoyi Xie <maoyixie.tju@gmail.com>
Cc: Lixu Zhang <lixu.zhang@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: usb: ljca: possible stack overflow in ljca_enumerate_gpio()
Message-ID: <2026061702-spherical-automatic-b249@gregkh>
References: <178169292186.2880769.16704395469053831415@maoyixie.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178169292186.2880769.16704395469053831415@maoyixie.com>

On Wed, Jun 17, 2026 at 06:42:01PM +0800, Maoyi Xie wrote:
> Hi all,
> 
> I think ljca_enumerate_gpio() in drivers/usb/misc/usb-ljca.c can write past
> the valid_pin array on the stack. I would appreciate it if you could take a
> look.
> 
> The GPIO descriptor comes from the device. It carries pins_per_bank and
> bank_num. The function has a small fixed array on the stack.
> 
> 	u32 valid_pin[LJCA_MAX_GPIO_NUM / BITS_PER_TYPE(u32)];
> 
> That is two u32 entries. Two checks run before the loop. One matches the
> reply length against the descriptor.
> 
> 	if (ret != struct_size(desc, bank_desc, desc->bank_num))
> 		return -EINVAL;
> 
> The other bounds the pin product.
> 
> 	gpio_num = desc->pins_per_bank * desc->bank_num;
> 	if (gpio_num > LJCA_MAX_GPIO_NUM)
> 		return -EINVAL;
> 
> Then the loop walks bank_num.
> 
> 	for (i = 0; i < desc->bank_num; i++)
> 		valid_pin[i] = get_unaligned_le32(&desc->bank_desc[i].valid_pins);
> 
> Nothing checks bank_num against the size of valid_pin. The reply is capped at
> 60 bytes, so the struct_size check limits bank_num to 9. A device that reports
> bank_num 9 with pins_per_bank 7 still passes both checks. gpio_num is 63 and
> the reply is 56 bytes. The loop then writes nine u32 into the two entry array,
> seven past the end.
> 
> I reproduced the write on 7.1-rc7 by running the same loop over the same stack
> array with a bank_num of 9.
> 
>   BUG: KASAN: stack-out-of-bounds in ljca_enumerate_gpio
>   Write of size 4 ... [32, 40) 'valid_pin'
> 
> The fix I tried rejects a bank_num too large for valid_pin before the loop.
> 
> 	 	if (gpio_num > LJCA_MAX_GPIO_NUM)
> 	 		return -EINVAL;
> 	+
> 	+	if (desc->bank_num > ARRAY_SIZE(valid_pin))
> 	+		return -EINVAL;
> 
> This needs a malicious or broken LJCA device, not a remote attacker. It still
> looks like a stack overflow to me. Does this look right, and is that the place
> to bound it? Happy to send a proper patch once you confirm.

We trust the hardware to do the right thing once a driver is bound to a
device.  That being said, making checks like this to prevent obviously
malicious or broken devices from crashing the kernel are almost always
accepted, so just make up a patch and submit it.

thanks,

greg k-h
