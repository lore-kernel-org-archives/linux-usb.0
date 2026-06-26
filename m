Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB5830D40F;
	Fri, 26 Jun 2026 09:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782465158; cv=none; b=l+/Q5kz2eiiJ/ZjuX3lTQ5MsBKXv4xO5bexxXWgyxx9w9GgLzKSY7mlu/kSsYbCC02Dq6WyjfvQXSi3nKCwZ+i+oUb7cqvceu3ewF1632R5rxj0WHzygFHWoWW82Blh57k9laRYNP2vLaJCJw5lxkZUQZiM26rerqb8LkgVpJ4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782465158; c=relaxed/simple;
	bh=Qikoo7ekR53urE0BHRU7Wrf1gH8Awx50/AvSB60gTNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UJQG0YQt7BSj+DsHKtMYGRfM9f+nzfPPjQhyZvNyI0RkiGGLVaimNQCb30qr4Ggal6COhi74BOIcqjIKsSaFVU8P89iwm6rpqvj9pWSkfneGc0RqWvK8gU7iGVxxmnn/h9UqrkL8E2OHZOHqebOB5pbtGoVqb/E5GUw3WGp/rqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=apbuyk1A; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="apbuyk1A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782465157; x=1814001157;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Qikoo7ekR53urE0BHRU7Wrf1gH8Awx50/AvSB60gTNA=;
  b=apbuyk1AzYBjrB4kz9gKHGPM//skNlgfZ9LExPZZ1AtQdxizAGVc4UZV
   Hr6dB7+HYuvp84xHTchzvw+W065G4W+wVhloHKwFBrke+5uXR5vqZeevT
   If9EqtpamlvssLen18H7pG06ZXE8x/w5jSEjgNz1wDI2U6KVX7VZxClps
   +Z+leMvhN1Pe9NLLiIxcWuJOowUByxWr2uEzOS3l+PF5OaO8x6BqVmT95
   3Ia3NQY8DZaZGIajzYeBWVpBMqpG4hEOVHdYTjpswrMWnAjs4DHDLGsIr
   oabygyhizrdYALj5kwxSw6UL5xFbK7p6mQ8IgiHS2hGwgqGR2WOD/zpIl
   w==;
X-CSE-ConnectionGUID: wFVdtY0sSAmKdvSajUxPZA==
X-CSE-MsgGUID: CbJD2IHySL+qE1/WPP/Fow==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="93915021"
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; 
   d="scan'208";a="93915021"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2026 02:12:36 -0700
X-CSE-ConnectionGUID: gcnur3qNQk+JihW3k5gxsA==
X-CSE-MsgGUID: ZFT61vRNQ/6Tov0Me5kpjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; 
   d="scan'208";a="244888566"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa009.fm.intel.com with ESMTP; 26 Jun 2026 02:12:35 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id F078498; Fri, 26 Jun 2026 11:12:33 +0200 (CEST)
Date: Fri, 26 Jun 2026 11:12:33 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: hexlabsecurity@proton.me
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: bound the DROM dual link port number before
 indexing sw->ports
Message-ID: <20260626091233.GN3066@black.igk.intel.com>
References: <20260625-b4-disp-9f8d8a2d-v1-1-d767f256c54b@proton.me>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260625-b4-disp-9f8d8a2d-v1-1-d767f256c54b@proton.me>

Hi,

On Thu, Jun 25, 2026 at 06:54:09AM -0500, Bryam Vargas via B4 Relay wrote:
> From: Bryam Vargas <hexlabsecurity@proton.me>
> 
> tb_drom_parse_entry_port() validates the device-supplied header->index
> against sw->config.max_port_number before indexing sw->ports[], but the
> sibling field entry->dual_link_port_nr -- a 6-bit value also read from
> the DROM -- indexes the same array with no such check. A malicious or
> malformed Thunderbolt device can set dual_link_port_nr beyond the
> allocated sw->ports[] (max_port_number + 1 entries), producing an
> out-of-bounds tb_port pointer that is stored and later dereferenced.
> 
> Reject a port entry whose dual_link_port_nr exceeds max_port_number,
> the same bound already applied to header->index.
> 
> Fixes: cd22e73bdf5e ("thunderbolt: Read port configuration from eeprom.")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bryam Vargas <hexlabsecurity@proton.me>

Applied to thunderbolt.git/fixes, thanks!
