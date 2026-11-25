Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795615494;
	b=FXCVAlAmEK05HYCcqvrVCh/fHhXyUl8oUicQENFvYwHdEV5aN/JW3w5ZkJWXMTuUiboT
	 LRhgPwOsDDl0VurxlIye6OVxgGY+TzEOUmvxm1C2WdukGXuWQGHMxejPxwEH8tFUxiK+z
	 B/6CjlKiD/1FQIEdwra0VX/nU/Njs9nuween+UFoqw1XGhSwgp7zGAWbgplfyDYP7Tuod
	 WjDEWeAR8vQ9wa/IiUTi5YDwKOnMYPhS6fiv2PBgnNiS01fu7fdpPb4ijUCcXV7tMS/SZ
	 kE61sDhYorI1ka+A0TY4zXqvtRpvuv9BuF9Kii755Uoe7dVc5+RYmLowayuYnRmTTFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795615494;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=PHCr3eh733k5ILXA3CONsUjnAKBFt4RJqDhyR1dGK4c=;
	b=427/nHJxQvPv+r6VltejwXvuEHy8UXXYkmFCg8JXvG8LhC9QVN1czMUfuuQmeZS6mUYt
	 Bd6sO88LGDOofOij5K1t9ZuJ9Tz/MY02FALo8ly57YJ/2DFM+tfJ2iww9kOzEgkNrKRuH
	 kKkxSoaPUlT4dU5WPoe6ASqwH9R1RBlUx/Rn6yz6Nf0KrAL+3Ctz7BLdklJtOeD5OxrzD
	 /ncu8gjf6OaawtxrjcBjQkKmnRAPcpqwjWPnwxgQ+RK4jIS/SEyuIL1EWAw83ZiSvCSzT
	 0FlsQN10jq+Z4iMqVT+nHFQ6D86rj+JoKopA3uUvkh6JAlMv7ZsN1rTqtmlAE/tLiCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Qfo6UQl7;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB9E606A321
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 14:04:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DB9E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Qfo6UQl7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795615494; x=1827151494;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Iz12OI7EDQ3a3oqyQjhNLS28A0RZ/bL5rL0dG85byGY=;
  b=Qfo6UQl7F+T7SBMn9gjysYp/YOR4bLANUWv4y6tiUB1baTzMqo5Ilry5
   ZnhiYKVk9MFGI25S9oWJb9Yb0c0QmS0kZAteM/6MGg+gzNtvwro/Knjb5
   A0dcv5z9f8BSjl0ikKm47ouszGxQU8wTS27mmL/C3LJwLu8d1AQ7Lslrk
   QGLAxPvmNLMgR4maXeKnVf1FOn39fGDgIOVLbbLuxX9/0vkjS84bnwdjO
   OUqC4Uzr/OXSpatBlBy0coAwJBe+9sY6svpaLbW6f+ZZ/eFCdkufZwX71
   +v+ucCWjlnJ/OlsFvwjPv0dKL/3Jbdk16v2zocDoeGJd3oIyKYD0yQIKE
   g==;
X-CSE-ConnectionGUID: j6yjRKXGTuSX9RbOhYWEAQ==
X-CSE-MsgGUID: ITChqJFVTxKHCbcsY+5bgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4471021"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4471021"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 06:04:53 -0800
X-CSE-ConnectionGUID: Vvm3F59zT4+QG2YkUjC7YA==
X-CSE-MsgGUID: a4htfVkvT82PU3YsHDaoEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="12095265"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa003.fm.intel.com with ESMTP; 25 Nov 2026 06:04:51 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 9242098; Wed, 25 Nov 2026 15:04:50 +0100 (CET)
Date: Wed, 25 Nov 2026 15:04:50 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Bin Luo <luob87709@gmail.com>
Cc: linux-usb@vger.kernel.org, andreas.noever@gmail.com, westeri@kernel.org,
	YehezkelShB@gmail.com
Subject: Re: [BUG] thunderbolt: request work may outlive control channel
 teardown
Message-ID: <20261125140450.GF191152@black.igk.intel.com>
References: <20261125130000.475-1-luob87709@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261125130000.475-1-luob87709@gmail.com>

Hi,

On Wed, Nov 25, 2026 at 09:00:00PM +0800, Bin Luo wrote:
> Hi,
> 
> I found a possible lifetime issue between asynchronous XDomain response work
> and control-channel teardown. The source path below is from Linux v7.4-rc1,
> commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4.
> 
> Source path
> -----------
> 
> An incoming XDomain request is scheduled by `tb_xdp_schedule_request()` in
> `drivers/thunderbolt/xdomain.c`; its worker is `tb_xdp_handle_request()` at
> line 762. For example, the `LINK_STATE_CHANGE_REQUEST` case at lines 896-906
> calls `tb_xdp_link_state_change_response()`, which sends the response through
> `__tb_xdomain_response()` (line 608).
> 
> `__tb_xdomain_response()` allocates a `tb_cfg_request` and calls
> `tb_cfg_request()` with no response buffer. In `drivers/thunderbolt/ctl.c`,
> `tb_cfg_request()` schedules `req->work` on the system workqueue at line 570.
> `tb_cfg_request_work()` at line 527 invokes the callback, then calls
> `tb_cfg_request_dequeue()` at line 534. Dequeue reads the raw `req->ctl`
> pointer and locks `ctl->request_queue_lock` at line 161.
> 
> The teardown path is separate. `tb_domain_remove()` in
> `drivers/thunderbolt/domain.c:501` calls `tb_ctl_stop()` (`ctl.c:750`), which
> stops the rings, warns if requests remain, and reinitializes the request-list
> head. It does not cancel or synchronously drain every request work item on the
> system workqueue. `tb_domain_remove()` flushes `tb->wq` (`domain.c:510`), but
> the request worker uses the system workqueue. The domain release handler later
> calls `tb_ctl_free()` (`domain.c:317-322`, `ctl.c:704`), freeing the control
> channel. The host NHI PCI remove path reaches `tb_domain_remove()` through
> `nhi_pci_do_remove()` in `drivers/thunderbolt/pci.c:594-619`.
> 
> The request kref protects `req`; I do not see a request-held reference that
> pins `req->ctl` through dequeue. A delayed work item could therefore lock a
> freed control-channel mutex. The `ctl.c` and `domain.c` blobs at this baseline
> match upstream comparison snapshot
> 4dce97c6c265544342e716e62fd24bbb232590c5.
> 
> Reproduction
> ------------
> 
> The attached `thunderbolt_test_injection.patch` adds a test-only built-in hook.
> It creates a minimal `tb_ctl` and `tb_cfg_request` with the real allocator and
> enqueue helper, reinitializes the request-list head, optionally frees `ctl`,
> then directly invokes the real `tb_cfg_request_work()`. This forces the
> lifetime order; it does not call `tb_ctl_stop()` or `tb_domain_remove()`, queue
> the worker through the real system workqueue, send an XDomain packet, or use a
> physical Thunderbolt/USB4 controller.
> 
> The attached `config.selected` is the complete x86_64 configuration used; it
> has `CONFIG_USB4=y`, `CONFIG_KASAN=y`, and `CONFIG_KASAN_GENERIC=y`. With the
> attached patch and config, the build and QEMU steps are:

Thank you for the report!

Can you provide the exact steps we can run on real hardware to reproduce
this?

Like:

 1. Boot the system, nothing connected.
 2. Connect device router X to port Y.
 3. Verify USB4 link via ..
 ...
