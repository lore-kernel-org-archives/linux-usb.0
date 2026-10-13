Received: from sender5-op-o15.zoho.com (sender5-op-o15.zoho.com [165.173.182.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE89346E58
	for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 19:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791919850; cv=pass; b=k9rkZR+2fLVHw6elX1cNIWPOtQ6htqpPSdhqqWCTUhZ7XIY8AGMBcVlOZJuTvocN24Y+0K1k2eqySmDsy1Hij8piIhaxiAMQmPRqYqTVD14v1kDMCdzUBlUfZdNA8EIcDbCA7jH8K49MfU8wTmBoSKOv5ortogE+75Br1QE22t8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791919850; c=relaxed/simple;
	bh=VHJDeE/xiYLLJMsXP9ehvKKGvrpJ0QiernYxGm7v34M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VljESc4fqVahM/gZmjGwLiH2tcxhq//dpxTrDHNlcvzmwKycKJt0rPhDoWw2nvEFiTGoMxRBvmtsn1O3NGhXVVh0bFit4PkQ4Pin+d0ua/I28tnyXADv2nJ6VOBDlgxLujZ9SvLqcsmoDazaM/ebzTHOaaDbUjtR2oLFww9lt2U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yiyuzhou.io; spf=pass smtp.mailfrom=yiyuzhou.io; dkim=fail (0-bit key) header.d=yiyuzhou.io header.i=yiyu@yiyuzhou.io header.b=QxFZLUL9 reason="key not found in DNS"; arc=pass smtp.client-ip=165.173.182.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yiyuzhou.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yiyuzhou.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=yiyuzhou.io header.i=yiyu@yiyuzhou.io header.b="QxFZLUL9"
ARC-Seal: i=1; a=rsa-sha256; t=1791919842; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mtFFaOYYXS66svnJV2b0zJnTncPXHcypHS6h3GxkI4e+EZj5kubhTwP4tYZx+5yXrzb8Wbm2VgTdrHucau3799L3CQ+E150Hzx4IPktUhhgYkWcZS1DEmV6NvjZmRTa8GqomOinkZwykdRvAbd1QCJ4KZwzzb0OSCjb6nqnOJdQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791919842; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=vEWGKweXaxp9UAp/GPiX9vZOgNgNRvicpkf5lD2FIgA=; 
	b=gOKDh3rlbKm9FvUHbzndhj3jOhqy071iH0K2mAikVOikBdXAS1v9bVFpJrjrDKfJl8ji/mzQOyjsfP8Dtdkx+le+zn+XKI5HKD76trpAE6RrSPtD93Z6lG/GMk6EMCj4PyFLXf0eAGiQisj5tnaZwz1AbsS3pyA8YZhovJ2CkcA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=yiyuzhou.io;
	spf=pass  smtp.mailfrom=yiyu@yiyuzhou.io;
	dmarc=pass header.from=<yiyu@yiyuzhou.io>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791919842;
	s=zmail; d=yiyuzhou.io; i=yiyu@yiyuzhou.io;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=vEWGKweXaxp9UAp/GPiX9vZOgNgNRvicpkf5lD2FIgA=;
	b=QxFZLUL9zoA98C8LHviRcqcchaSxfabKGSh7ZUF4Dq3J8Dlx3yB7Nev0YGpXA9I/
	JcOJ2t6chOvCkJzIen4ixePLToETx926377t2/ONk6H8p/Aj/JXjhNij3kHbS766tEr
	harh3nA2V9A2Q81tEDkjWPQigZMh4BZW3tJHuJ/Q=
Received: by smtp.zohomail.com with SMTPS id 1791919840215816.831791075335;
	Tue, 13 Oct 2026 12:30:40 -0700 (PDT)
From: Yiyu Zhou <yiyu@yiyuzhou.io>
To: sashiko-reviews@lists.linux.dev
Cc: Yiyu Zhou <yiyu@yiyuzhou.io>,
	mathias.nyman@intel.com,
	michal.pecio@gmail.com,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] xhci: give back all TDs when skipping endpoint reset after disconnect
Date: Tue, 13 Oct 2026 12:29:34 -0700
Message-ID: <20261013192948.1326642-1-yiyu@yiyuzhou.io>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <sashiko-outbox-169215@kernel.org>
References: <330c34fd-1d1c-44e8-b949-ad2f5fb51f00@linux.intel.com> <20261013073825.17962-1-yiyu@yiyuzhou.io> <sashiko-outbox-169215@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On Tue, 13 Oct 2026 07:56:11 +0000, sashiko-bot@kernel.org wrote:
> Can this newly added call to xhci_kill_endpoint_urbs() leak bounce buffer
> DMA mappings?
[...]
> TDs that were unlinked by xhci_invalidate_cancelled_tds() are removed from
> ring->td_list but remain on ep->cancelled_td_list. If the device disconnects
> before they are processed by xhci_giveback_invalidated_tds(), this new call
> to xhci_kill_endpoint_urbs() will process them.

I do not believe this can occur from the new call site.  All callers
of xhci_invalidate_cancelled_tds() give back TD_CLEARED TDs
immediately, so unlinked TDs remain on cancelled_td_list only while a
Set TR Deq command is pending.  During that window the endpoint is
stopped, SET_DEQ_PENDING blocks the doorbell, and xhci_urb_dequeue()
queues no Stop Endpoint command, so xhci_handle_halted_endpoint() is
not reached.  Any cancelled TD the new call encounters is therefore
still on td_list, where xhci_kill_ring_urbs() unmaps its bounce buffer.

The missing unmap in the cancelled_td_list loop predates this patch;
previously, xhci_kill_endpoint_urbs() was only called from
xhci_hc_died().  Mathias, I can fix it in a separate patch if you
prefer.

Regards,
Yiyu
