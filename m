Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793804573;
	b=4Er2nOOSP6xNafpyK3yUDRzc99mX2iPBvQZYy0oSaJp4vRyO75XQ6ut06NHr12hjFnyO
	 NIk61doggpw0fQkz3Ofz9p34NekVd9IPnEgMvvRou8w1GUXXlLckOUbZ9tXkfBAa4NUMx
	 9gGXoi3jwYrjwM9koOJDXS0ggOhHvjp6v8lfCGCmhEmgbI0Kk+38jBI9DwGdbtQqcDyj1
	 BkZRmuC87+zjmNmRDVWcWsMILAigMMx1IFYjoTBMD6zOTJmjfTXVSoIj9qxoVjLmYLBaN
	 46nIL9AmncGSv6136UgskofG09SS4ookF5fYS9wJjW5QbYObBG0twr94msViXc9hpbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793804573;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=VRcviXFa9rkB7KYLvZ2EGeC1SAJ3+R/ZxlW12h1h3dU=;
	b=VjKMO1VojWx7tach+j5iKE2sBbIuVMgOK3bbMxQFXYbWNpP3p+Zb8HskVtkuYubcL/e0
	 UaWttsW4MP8vwwzx48MJZNn/nCidvcIcIVKCBlaIuXYCs3Gl8ZGp/j3OJelnWquq8GdW2
	 6kbw1609laCLcp/mP/atfBZCyv7XgsjsAxowHLEE8Tt4sMLZ6KtfgExZJfcQftp3dMsQY
	 M132JpiP5gZukOm2kT3CQoY9fQHb+vrUa/LyqDlsucxmDNCmh4Bfz62cV1JXM9TcDfLZ0
	 xlPCDbS2/xvmNmyXOxKP2cu31NpDhUYButWZYStgftN6LkuSZsLC6/Ld4iSf1baZMOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=G5Sa9PUn;
	arc=none smtp.remote-ip=74.125.224.50
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6A2606A328
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 15:02:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A6A2606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=G5Sa9PUn
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-6767d92cde6so980912d50.0
        for <linux-usb@vger.kernel.org>; Wed, 04 Nov 2026 07:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1793804572; x=1794409372; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VRcviXFa9rkB7KYLvZ2EGeC1SAJ3+R/ZxlW12h1h3dU=;
        b=G5Sa9PUn1Mj5I8Osq6ere8TbLXiHE1wcqzVnZUMRHT/aAz0eTMAdvQttJXJmVwGquK
         kogqp9BQwfOm1NvE8m/gbYDpg3qD/sqjQhx7VsurmVC0+qUAJEjbmrcBtCCNY7X/qUeb
         YQ5dCeYPYn0aHuhgKlqoLC0kpWddU8OSHrXe2DbuHWMbLhgBnjhJiL9yqUYjgJ2HkYTe
         MkpfLyPHVXuAiBFtE2n/Bio76b9sy5ZTbIdu3tv2w5NdVrxEiocYIuMXyQjgs+tfp6Jf
         lU+zFRbMk92GiKs/izMMB8BqDUhabGORNhaSIFQ3+lbL5PBhL9DEJsrqgxUNtRzipDCj
         8VGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793804572; x=1794409372;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VRcviXFa9rkB7KYLvZ2EGeC1SAJ3+R/ZxlW12h1h3dU=;
        b=EvJRl40SpqUt3Ogwoof+l+M/o30L6lZ9Fqhx1wP0MDpxNPeArROQPdJhv0VSq0paK1
         GRLdVEP1/VscnDUcuZs9zlBLnos4ZAegU1bB94oHguhy7qC+sZQDM5lrHe5REvOSnS/2
         n6wCf7OueEJzLpEsy7nOX49SpYGaMIbZbaIp7sn+uW3ujClY62vG1AcRr1w5q8pBG6MC
         G9gZNV2rc2HJxBipmpQnU9du8Kc1xyxXSO7xfRBUeLH0EKjukABswI+1Rhk5wedcUSvi
         Q3014Kq306TCwMscnqrckPwl2yhsFYKh+q6VvjW6K3dpgyxgvPBnVdLH5ClJQzhg/wKO
         xpkQ==
X-Forwarded-Encrypted: i=1; AKwUvByQRLKCTIMUaX/s0IxNaJlrhnacyUBJ/0rJ0lz0H18ANPm8RBpyat/dckd/j6hjtldzH9ZcJYdGeQg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+cx2sD+Hbg77wj1dUqOBUf7J5H3q7sC5hEwaRpA2BCCeb6VTkC
	MMXpjoD/uNuSBftdqtD6jNvPFKLPjkaJBjwSuqrx/0udYEEqcSUIf72g6NzvfcZZ3A==
X-Gm-Gg: AYBFou0BRV4uel4bfgSOYOyDTGYpDD3HhKcf3qEFPD/jJOaJC7H5e8dQRiVTDkKQDbM
	hwEMPwcNoVGMpzlqUVgB+Iff11Lze1Fm5ooO7lTAwk8pCqQF6WYj80NMmV6hT+7CWLi3+EFJrtP
	XoLV6KMpwJVU85Ff1nhlzBVVjqEtGISBt0qZZIRSq0AMBUhogiMNdSoinD6AVECxIt5FiotHKN+
	V7JcBGL/6+vhq4pOlZkMlwDA+nD/t6U3FFVPan8HwWKB2cVaJuXTH71bBNqczNihrrnvaqMkSkC
	Ew/Zbc2Iuj1LCFXRi2HMYbHNaj3m+P/NAHoKgKCqjageJ9CWDuAqCdnp5S7W+LU4q2bjRCX9K61
	0A1+qmvNx1X2ruCU641keXWh4i275Fosm94CLU94iQsi7v2pyVlGZtDEpEoWolb6tUn3QEwIQXM
	cCNbvihYnWhRWFAb3ZTTiNMOODImvqUnU52WELnV0D5UzbRZVfeB9AvgbbZrgkOIyBg1UpvSwk9
	miZmXPt3/Gv8PL8j1aIBRK1QS1TfYhLeJRVXOrDOQQIMpViquPGe6abObkANisgAEty1iztmiJN
	BXl6zovHAgPZw+OsaESL/0PQrmSh
X-Received: by 2002:a05:690e:11c5:b0:67b:f39d:89b6 with SMTP id 956f58d0204a3-67bf39d8a2emr1123228d50.32.1793804572093;
        Wed, 04 Nov 2026 07:02:52 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91e7e75b24asm20768526d6.39.2026.11.04.07.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:02:51 -0800 (PST)
Date: Wed, 4 Nov 2026 10:02:48 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
Cc: Michal Pecio <michal.pecio@gmail.com>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Bin Yu <byu@xidian.edu.cn>,
	Cheng Wen <wencheng@xidian.edu.cn>
Subject: Re: [PATCH v5] usb: xhci: Fix use-after-free race in
 xhci_stop_device()
Message-ID: <b8ea2f8f-ff9e-4cc6-853b-114fe51173e6@rowland.harvard.edu>
References: <20261104000031.679944e7.michal.pecio@gmail.com>
 <20261104035637.3325-1-25031212351@stu.xidian.edu.cn>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104035637.3325-1-25031212351@stu.xidian.edu.cn>

On Wed, Nov 04, 2026 at 11:56:37AM +0800, YuanZhe Liu wrote:
> The port suspend is a hub class SET_FEATURE(PORT_SUSPEND) sent from
> userspace through usbfs, and the teardown is userspace releasing the
> hub driver interface, which quiesces the hub and disconnects every
> child under it.  Neither side takes a per-device reference, and the
> usbfs control request is not serialized against the hub driver being
> unbound.  That is also why xhci_bus_suspend() 100 ms after a disconnect
> looks fine: this is a different entry into xhci_stop_device().
> 
> CLEAR_FEATURE(PORT_SUSPEND) is the resume direction: in
> xhci_hub_control() it ends in xhci_ring_device(), so it cannot produce
> this trace.

> The patch makes xhci_stop_device() re-read xhci->devs[] and the "device
> is going away" marker under xhci->lock, and give up with -ENODEV
> instead of touching a device that xhci_free_dev() has already detached.
> For that check to mean anything, xhci_free_dev() has to clear
> virt_dev->udev under the same lock, which is the second hunk.
> 
> If you think the mutual exclusion belongs higher up instead - do not
> let usbfs suspend a port while the hub is being unbound - I am happy to
> work on that; from your message it sounds like you would prefer the fix
> there.

Don't know about Michal, but _I_ think the problem should be solved 
higher up in the stack.  It sounds like the sort of race that could 
affect any HCD, not just xhci-hcd.

Alan Stern
