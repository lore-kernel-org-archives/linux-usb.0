Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836544B44CC
	for <linux-usb@vger.kernel.org>; Mon,  5 Oct 2026 15:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791214090; cv=none; b=kyQFaWco0bZgNJu2/TIhznurUk6JXOqq4LxzX+RSN0V3ek1SEVNlONDyKE8uvBx1apL3WTHsa58PQYxIB4qGxzXmozIplWQe240ceB2wa1aNJjMsAzAcB3EXh4VsPkYv2Y0EEys52MlUv4vj2feGyc9bs+VYT43VjhEQynBaAis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791214090; c=relaxed/simple;
	bh=1vx//3v6mHJqg3tJ20nWqMtc31JukUDeN4f33xE/Af4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eHO5qSgY58PcsEexXpop+bYdAWxwpnnWhDLEmYanmqIBWT58nRdY5emiGKwXP4O2sEnW1Thai9H2qKRFF+Xm9aMugzcfY3iYw77BMsilAExhvY8m3K5dDB4UrRkWfjv74LiDQaHQR68672/RGSVi0jhMFupkrEV6CjrDRKSt7J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cf4G73Q3; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cf4G73Q3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791214089; x=1822750089;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=1vx//3v6mHJqg3tJ20nWqMtc31JukUDeN4f33xE/Af4=;
  b=cf4G73Q3YAKY2+L3QjUUoh8vy8Z25iCXswN2csNYtjyU39aCcy5l43Sy
   /CIw64mrHTMgNPMXUkVN8Z5BN65B0857DL/lRHxRYhTd5YMP4fjatgDKM
   l5vuBPPeUr9KEDkPkYpEG2d10g7G62DzNwbqCKbHLKdurFcuoOoppzJLh
   0JuPD64o+TK67Ln/cD4KQJJAf7CBML8nyaHNZjwbgtru7XaTx/Q3TrrSd
   9e2vlq7tNZT+bOM42DugKVIUMp80mL4U4ETrDTUnPlC9DVPZ0HikmHZvq
   2LdUFon4ogQrEy50T1l0VBFPikeJGGFM3J84M+qTifa+UNXLdFNh7Srdz
   Q==;
X-CSE-ConnectionGUID: OFCqRXXDQKOSOgOfGyn9GQ==
X-CSE-MsgGUID: w1zZsCCYTj+I7HlRzrqnhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="91019146"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="91019146"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 08:28:08 -0700
X-CSE-ConnectionGUID: +eXropkqS7Kx/ZYwTHc/Gw==
X-CSE-MsgGUID: q0VsKZZVSXyLPj9teNhMNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="276374778"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.212]) ([10.245.245.212])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 08:28:06 -0700
Message-ID: <93f1090f-ed09-4e76-8621-c30583bdac58@linux.intel.com>
Date: Mon, 5 Oct 2026 18:28:04 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xhci: dbc: lock the minor IDR on registration failure
To: Sang-Hoon Choi <csh0052@gmail.com>,
 Mathias Nyman <mathias.nyman@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, Changyul Lee <lcy8047@gmail.com>
References: <20261003.final086.034e184ae398239b@gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20261003.final086.034e184ae398239b@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/2/26 22:47, Sang-Hoon Choi wrote:
> dbc_tty_minors is protected by dbc_tty_minors_lock when entries are
> allocated and during normal device removal. The registration error path
> removes an entry without taking that lock. Different DbC instances have
> separate event work items, so this removal can race with an IDR update
> for another instance.
> 
> Take the same mutex around the error-path removal.
> 
> Fixes: e1ec140f273e ("xhci: dbgtty: use IDR to support several dbc instances.")
> Reported-by: Changyul Lee <lcy8047@gmail.com>
> Assisted-by: LLM
> Signed-off-by: Sang-Hoon Choi <csh0052@gmail.com>
> ---
> Compile-tested the affected object with x86_64 allmodconfig
> and W=1 (GCC 13.3.0). Base: mainline 3b7cab693ba2bab63774bf5b988e8a61b2ef0f32.
> No hardware testing or runtime failure reproduction was performed.
> 
>   drivers/usb/host/xhci-dbgtty.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/host/xhci-dbgtty.c b/drivers/usb/host/xhci-dbgtty.c
> index 3d51e8d82659..2249cc16800c 100644
> --- a/drivers/usb/host/xhci-dbgtty.c
> +++ b/drivers/usb/host/xhci-dbgtty.c
> @@ -535,7 +535,9 @@ static int xhci_dbc_tty_register_device(struct xhci_dbc *dbc)
>   err_free_fifo:
>   	kfifo_free(&port->port.xmit_fifo);
>   err_exit_port:
> +	mutex_lock(&dbc_tty_minors_lock);
>   	idr_remove(&dbc_tty_minors, port->minor);
> +	mutex_unlock(&dbc_tty_minors_lock);
>   err_idr:
>   	xhci_dbc_tty_exit_port(port);
>   

Thanks

Adding to queue

As an additional remark it seems that this issue is a bit theoretical.
We just allocated that id in the same function a few lines earlier (while protected
by the mutex).
The tty port device never got registered or used in this error path, so nothing will
try to use or find anything with this specific id.

I think internal XArray synchronization working underneath IDR can probably manage
idr_find(), idr_alloc() and idr_remove() calls for other ids even if this one is being
removed at the same time, but not 100% sure.

Let me know if you can describe a scenario where current idr_remove() in the error
path without the mutex protection is an issue.

Thanks
Mathias

