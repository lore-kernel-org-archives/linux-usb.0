Received: from out162-62-58-211.mail.qq.com (out162-62-58-211.mail.qq.com [162.62.58.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD19C35C683;
	Wed, 26 Aug 2026 07:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787727649; cv=none; b=ARe4wMT+BOGk41lRNDhjTXTIriXLMBcTCQ+F6PixOOxExTUDEChZD95vuHMQBonXPG7Vvlr1KScge79SjVEbpX5tjFksH2ly7/r3Blc+EiT3EWh8WTVK0QH3fCctKiVxaGL9ee3pR6mcLJoSsbkg2kAOHuxC38eQ1P2mBPEhi4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787727649; c=relaxed/simple;
	bh=CMnXLSx6Sn5rJ5SaXWN0rtTV/wvYfi2F25uSQg5lroQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V0l8OBsW7NQBMFVCBV3Y1fJADBbXpuqhp90SvL69HU+tsM9OYI7zuluLnX9ALHzCDhksckSwXrNdckMKpHBC9SixMk5AUTVmIgii7cvNRYTOLDfYHQN7EXBALr2zhZMLUeOUVK3ers2qdzlhL87om63gUd86RUnvy68ovGCrPiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=LDG3bX3n; arc=none smtp.client-ip=162.62.58.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="LDG3bX3n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1787727640;
	bh=qL9k2UjdGtOcNDAG485lFdrXLHwG6ZNnL+8BxlJZ71A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=LDG3bX3nLbZn6k47/x8tGsTvqjLdtmeNaa6x861PL84zwNsafWduuIOTyeOptO99W
	 vyG21AdFLxdnba3WfsSpan46N96TVFXRSeQ4iFi8NEekZkmREYfkjTWcMCBQhr/KzC
	 8YFKvL1V4RFtYqMLSKpzdmB918oJzEdDWfrS6sMY=
Received: from [198.18.0.1] ([58.206.203.238])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id 269020E; Wed, 26 Aug 2026 15:00:38 +0800
X-QQ-mid: xmsmtpt1787727638t6j51abmk
Message-ID: <tencent_73FAA277D81B3C4771D63F33904760133A08@qq.com>
X-QQ-XMAILINFO: N6D9E5+XF5AcFq5a8YMIgyiakv14LGnE3GBDEU6UotNlIf9LswlkdLrrr3sL+5
	 B2/R4JWHqb+nOvanjcSKDLB1BcPYLlAaWPohH6rOlgH6Ogr5ndWiRUhLBu2gnaWyQ1S0gZdEpLK+
	 Vskv58Sj31lLH+lhNS2WNQNMSIsagzRUUEhAt4eJ2zzA4r6LkFBuqmnysgLxIMFz98Ky+ZkWF+TM
	 c7FrXYjiCV5A1X+njXbn6EfxVwFLcbHmArK3AvkxRpsSe72e+NDgFDNckBXKe5F2odOQbZxGKy9H
	 tB0ZGCs4gy+QkGa0H1fRhYtQ/f8SRn7O2neb2xQSydmwEK8zeIz4KOR5TlONpFqr72J+Upjtu99F
	 Edr+hYfAIK+v7lakoqMDQdmyeUw+KEBlbWnxi5RnD1OIeHnb1O8fSaTj5/zp5hwAte2rMD7yEK2P
	 mt2fjus/SGXzaLf+cB3mc7vBdS3eDnervR0MhrRTTXRUvkkeh8tGcw1Nqj73s8iJeb/y67I0Kx1y
	 +SP4LaRIE6TTTEayjqbstDuj3XcP1PUDT2p0sl++sNi3TEtCcZqCXgG8KwWZsKsTH1c91ZD4lnWQ
	 Qhfjbv8HbDS12MPoTfnCzC9ITSUhQyb88PhHaHjdKt8Q+XCVqtgrwpNY7KkcvRKP1oU1AKExv+3k
	 Z1RPH4IdNTmq/3OyDJ7rh0r0a/UgRXAhpX/azGwTfidLo6DIm2mRxWhAYJ0BG9ezU0FIxJ7SzN75
	 xt2ceksajbLPGCmSkjS4zNNqnd6R3In3Is2GvtVSpIGizFu+KepijBL/UPU0Caqh43nM2rb+XwMx
	 XYlm6ElOx1BCZlKGp/rSYTkCTxev0rFNPm0t/VxYIijC2ejOm+6poI3Ohf6Gzz7GjRiYJr1ksUpN
	 jATXYZKgO5aYip59xHNmOaVBA2RhCQJAJmpPwe+7ou1hu8xi+ezoR+f7PmnjEd0VXugQRGhvumtP
	 BbL5r3uxGNJGxp5/HU7VnIscfAfqg8EkocX2ofh5+RVwqjGHzLiCTLHfMlRVZOe7Odui8x3dNehD
	 eWBC1OD3xrYXrp5BwFN2njQ3GVMIeCr0WwAmt5ruPr7gg82AWUnA7c1woKT3Rs/6bNerLGX+Z/9u
	 7uGnvm78jkWKjJee66gVwcWM1795S/gLHn3WFY061C3R6g81U5oBda1uW+1lh0AFJaqK2A
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-OQ-MSGID: <a983219e-82b4-4148-a858-e97d7960df49@foxmail.com>
Date: Wed, 26 Aug 2026 15:00:37 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: gadget: goku_udc: fix kobject warning on probe
 failure
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>, Felipe Balbi <balbi@kernel.org>,
 Peter Chen <peter.chen@nxp.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 syzbot+06ec7624018233e17113@syzkaller.appspotmail.com
References: <tencent_0AE8C419FE6042BA8081E98C88BA604FF00A@qq.com>
 <2026082616-glue-atlas-0cfd@gregkh>
From: Cheng Lingfei <chenglingfei@foxmail.com>
In-Reply-To: <2026082616-glue-atlas-0cfd@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/26/2026 2:11 PM, Greg Kroah-Hartman wrote:
> On Wed, Aug 26, 2026 at 11:35:58AM +0800, Cheng Lingfei wrote:
>> goku_probe() calls goku_remove() when hardware initialization fails, but
>> the gadget device is initialized only near the end of probe. As a result,
>> goku_remove() calls usb_del_gadget_udc(), which drops a reference to an
>> uninitialized gadget device and triggers a kobject warning.
>>
>> Initialize the gadget device immediately after allocating the controller,
>> but add it only after all hardware resources have been acquired. Track the
>> gadget and proc entry registration state so goku_remove() can safely clean
>> up both partial probe state and a fully initialized device.
>>
>> Use the split gadget removal API and drop the final gadget reference only
>> after all hardware resources have been released.
>>
>> Also obtain the controller from the embedded gadget device in the release
>> callback. Driver data is set on the PCI device rather than the gadget
>> device, so using dev_get_drvdata() there fails to free the controller.
>>
>> Use a per-device name for the debug proc entry so that multiple
>> controllers can be registered without colliding on /proc/driver/udc.
>>
>> Fixes: 3301c215a2bb ("USB: UDC: Expand device model API interface")
>> Reported-by: syzbot+06ec7624018233e17113@syzkaller.appspotmail.com
>> Closes: https://syzkaller.appspot.com/bug?extid=06ec7624018233e17113
>> Tested-by: syzbot+06ec7624018233e17113@syzkaller.appspotmail.com
>>
>> Signed-off-by: Cheng Lingfei <chenglingfei@foxmail.com>
> 
> No Assisted-by: line?
> 
> And do you see this happening in a real device and not just a fake one?
> 
> And why is this driver using proc at all, shouldn't that be in debugfs
> instead?
> 
> thanks,
> 
> greg k-h

Thanks for the review.

I do not have TC86C001 hardware. The issue was reproduced only by
syzbot, whose reproducer binds goku_udc to unrelated QEMU PCI devices
through the PCI new_id interface.

The probe cleanup path itself can also be reached on real hardware if
one of the probe steps fails, but I cannot claim that the issue has
been reproduced on real hardware.

The proc entry is legacy diagnostic code from this old driver, so I
agree that debugfs is the appropriate interface. I will rework the
patch accordingly and send a v2.

I will also add the missing Assisted-by line.

