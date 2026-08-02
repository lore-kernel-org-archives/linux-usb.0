Received: from mx5.mail-out.lima-city.de (mx5.mail-out.lima-city.de [91.216.248.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7432F7F1B
	for <linux-usb@vger.kernel.org>; Sun,  2 Aug 2026 17:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.248.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785692646; cv=none; b=a1dUrpoDs5RK6yTs0wIzGG7qoUYxQ6nzEPiyuV2J4XgBwpUv1ZR4TUdUtWaeXICLfHtQ4DWt25kAOt7UjTfS4AYe0cfJC8hAZsVzFmt+YDJRTRuTu3BWU6GLNlp/dz2zFU4YzGjXZoiSUCN+qnL84YM0tpc9L2vEsjvzFHg3Ehw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785692646; c=relaxed/simple;
	bh=Bp1ae2vgzK/GTp/o1zNw72JgBOAIuy7piWkv6wbaBuk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eLNp8/AFNlqjn57+Ma6UU1+5FVq0SBVpqSxMjkYVpRRkAmj/LkiFxL1ckPOusFpRV3CTewEfj2NWpVcsJyUIb2Qb+caoOc290zckfcdRf/AE//kdXa0Bm4fvLYsi+hyOn8UsAszN3dyJ9Soo+h5vRGCg3T3pwgXOTz6J6LclQGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks; spf=none smtp.mailfrom=deq.rocks; dkim=pass (2048-bit key) header.d=deq.rocks header.i=@deq.rocks header.b=opU7BuwG; arc=none smtp.client-ip=91.216.248.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=deq.rocks
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deq.rocks header.i=@deq.rocks header.b="opU7BuwG"
From: Andre Eikmeyer <dev@deq.rocks>
X-Lima-ML-UUID: 99e3ac60-db84-4541-9b41-19999dceb006
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1785692634;
	bh=Bp1ae2vgzK/GTp/o1zNw72JgBOAIuy7piWkv6wbaBuk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=opU7BuwG/xDy83YSNVcTGvfyOBumkoVNZ0c6Wk2zMX336BUEU44MsLBI2jzMeboTI
	 HX2SLMpA4s01hHkIadj1b0gMi/27OQoE+F7y830nWT153Dw38neqPQqTI1AlBiIyG1
	 ZCR8HXah6bUBYdcm1F/jhQTwdRaD+CzqK+fOw1YuzMHAGIkn1eRlPxNKgCRGeqxd+k
	 olAD2WOp5hmsi8OSj2wZftS7A3iZau6GHaZSiESmL9/xHv29f5MYDYaMzYJ5cs4kqq
	 SWGQ/3RW5VLMjHXjatIy2PLQIApzq81U6CEu/Ofq7q9RP7V9E0nw6cwrjcAA8Ni9z5
	 hukONJwisK/Ag==
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: Andre Eikmeyer <dev@deq.rocks>,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] xhci-pci: keep Titan Ridge active on MacBookPro15,1
Date: Sun,  2 Aug 2026 19:43:52 +0200
Message-ID: <20260802174352.13097-1-dev@deq.rocks>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260730210655.15514-1-dev@deq.rocks>
References: <20260730210655.15514-1-dev@deq.rocks>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello everyone,

Please disregard this patch for now.

Further testing indicates that the reported USB hotplug failure may be
caused by an initialization/runtime-PM ordering race rather than by the
Titan Ridge xHCI controllers being unable to enter D3.

Keeping the controllers permanently in D0 avoids the symptom, but also
prevents deeper package C-states and increases idle power consumption.
We are running additional tests before proposing a more appropriate fix.

We will send a revised patch if the race and its correct handling can be
confirmed.

Thanks,
Andre
