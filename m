Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F79537A832
	for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2026 02:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789612723; cv=pass; b=BCkavMoKaQW7vj0jNGZxSPHqkl2vIsrBcTyCJkBMoOvvqiU9qRfizq5sAgN9XhnEW8DUVa99SPyihIhfKmqOKgHFuHuIg8YihAeAKbP7BB0no8MFgcPCV0BeF5OKtOX8ETlyHibRF2/DlEAzhpTeVxxj64XIVd/k5tBKMNoKrUI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789612723; c=relaxed/simple;
	bh=vq4o8SMQXm0gA308FoVdVzcFOKue1qv39OaHjktBjk0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NQZ1hV0C1yYV3EdBWaclcQMr51TW7FqXrwOBfCg2hE6YUIy8En/G0zz6OOt864wve+Bz0WPGSq8EumRBuhjzDCISN4XzlroHdR9KURg/BEBHhJUKcibwYNQxAC1BKN9Sq66LS5ITJoKPOF1oGd0wCMOB1BiNom1w3Zau3OYTiDg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Fr2BErdp; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Fr2BErdp"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843172bff4so167843f8f.0
        for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 19:38:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789612717; cv=none;
        d=google.com; s=arc-20260327;
        b=E6G9LNXPtXkHDcHvJT2aJ7R7Q5bBpK1dheJ5Fb5i9+Pv4N3jFsv+Q/3ShWi9uJnj4R
         NBVzl5IheEd+W4zdzSePJ45Oj70qBZ1lUgq2cBb5jDQFaUEUTTXeiYjGdeJ+mv3DnxaG
         C8Bv3soQcET6H9EdR98bgSlTMF0pUvHnRKBTAX9NXHBmzuPf3YBepwl3UtbViycvEPQ0
         j4vhOOdSI45eP6//kxSSQw/YFdmOwoIEdefgFWAtlcznHT71sfH5fKp8i3yarqcd8vHQ
         +vDEbqnvxK/SoXJEHGoztCBNxAmb3tMHSQl+1/SRyWjtNxvTcV4pi0Leoonfs1BEWRNa
         WKag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vq4o8SMQXm0gA308FoVdVzcFOKue1qv39OaHjktBjk0=;
        fh=e/7rYeqOSn7iCOw7m9LseJRVlSMK0pg4PKXOrHaqccU=;
        b=UY2/+CA4+08lshludDX9mnL/sVv8Yg2lDLSTG+6ZWAglFYsicmUvbbcHrqtaFqGZKJ
         ZKaYs7BYQyHW9fRLdhUcrSBYrUG03gQnD7zrkjqwnYeVW4ryABPhq3LcObyZzR++WM0S
         XLUBFrp5DS28+RvSKx964VeBqWtrWLjWYv8DI5g8+qy98v6FKpEF03yV+btfidG0thG0
         1+lm76nJwJ96m26t/+fQgQxJEIJ4ze87Mkd+HwbNrkzDLiCIPHyMu6VNKnE1cVMQpoeb
         aI+Z9DwX57nFXxAFbECURDVBEHp2K8N7kOzCCHwXDZP/OQn6xnwKVG5eS64jmCy9e7aR
         QRYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789612717; x=1790217517; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vq4o8SMQXm0gA308FoVdVzcFOKue1qv39OaHjktBjk0=;
        b=Fr2BErdpNEyRRXm/yaFnwVK7SRheemtEuSvCkgNqa6eReSyU2ckmNMs6Cjetx838FX
         zBf1i3aNfTji3i04D6J7wsC77qqNRojD2V8aqEIdPeBCdU5oD90geqfKuLnKmKCmq9Bv
         hjqqts8Swlr5K97CFwinNd5vACChbH5zSCX2vj4cTdl89km07jvIfWMhLECfbF9PmFOX
         XVOMhRxsGc9ROysYfZntXVmErea08KTxv9KkM4A10Zt4AowCS5fEk2uDxtZo7c00UyHM
         EmgZdTMQJZQnLRyMbI0CO7IDzidX+DwhSeCeOjm2mBb9/+3oXRkCKq4M+2dC0RCHPFkT
         C/lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789612717; x=1790217517;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vq4o8SMQXm0gA308FoVdVzcFOKue1qv39OaHjktBjk0=;
        b=ALJ/tP7aFsQPCArZGIf1p5O2BU93O7z+7eSNwlADTGQRwijystwcR1ZiQ1plbLaxGx
         jap8xxPdo1TpFPNNKYt5bVys3+Dj19blR1mCEVI4OMvpKLL0Pm/JllxcSRMcVKKx69mP
         4dzJsA7GmQjRXY5uX/SAAbuYg70oZHcK/fTsAIx1kV1KQow6fGBGpJZDigqkT39XLAbw
         FnTiGnRHMAt3/pTkkF+tSpLBavizYauU/cBDsjn0lqGwN7aZ90Ne2XGEUjVLNztg6Hto
         lddnzFNz8bQ0tiqcp+w/ylhHpcuDSPzTWVfODTSOpjzJ8l/8gRtcxDiJkrbg+SKNXLCa
         xTng==
X-Forwarded-Encrypted: i=1; AKwUvBxQaip1PvFC2Cc7myJsXq02swYYyxfuBRXuIFGY2AC4ByJaVdE3RA50e3YckK+rfU6hbc9DyBcvxfo=@vger.kernel.org
X-Gm-Message-State: AFuF++kh6rvqJmSEjCuRKajK0V6cEeAh5ITZP/ohCy2V+ib2nnNwFG2x
	vAzp1M4eeoY4SiZOWL8r12/8ep1H9Q/4S1pec1VPns58QrGDxnpYj+GHkNBkSNETrY5Xime92kV
	D/S9w63Q/gFoId8ybzc/abcwdRSA842ObbPO3ATS8ijShy9ClssyduGGx
X-Gm-Gg: AYBFou3gndQoK5PQqC8KVQAqCbgMAi4934ujWCNyc+A4bRKQ+Y54Z4m8o6XrKQcnnEa
	RwrXJnZ6atKQnjvLS4yl1/O7tHRywLSA8w6wSBhBOyS1okEY75sCAc4YZGhFWG0X0umqALlb0Qu
	mUe7INlNP0EqzCPYeZG6VOL/bnCKgSVLQRc73TZhHP/UM3dVbfNZvvwlaQ2rFI6SX5F0wnAhd07
	GjiM+Q1I+24GdGZFeUmUt8EVOLJbtB8a1WM90UnVIN8WMg29vfyApxBd2mi+NhC+PsntfcHNrlO
	P9iIYN0gmT/3U/9P3Z/BRgVaH9CCm6qVOfUvLPJWWyDgQMsn0OoKUckWFF21rA==
X-Received: by 2002:a05:6000:490d:b0:487:342:d142 with SMTP id
 ffacd0b85a97d-4870d16b276mr5758481f8f.44.1789612716970; Wed, 16 Sep 2026
 19:38:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911193208.410015-1-jthies@google.com> <2026091633-sinless-freezing-0184@gregkh>
In-Reply-To: <2026091633-sinless-freezing-0184@gregkh>
From: Jameson Thies <jthies@google.com>
Date: Wed, 16 Sep 2026 19:38:25 -0700
X-Gm-Features: AcwNN1XpuCi2cTM7SKEf-K3jHaqLdXUfZIHv1kf9oqVEKu65nfK0QgLQpuCFung
Message-ID: <CAMFSAReNTsHdCqAX7RUEKUhaAeHOfPoLRUpEyLrAEkJAZDOvFg@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: ucsi: displayport: Current CAM OOB index fixup
To: Greg KH <gregkh@linuxfoundation.org>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bleung@chromium.org, akuchynski@chromium.org
Content-Type: text/plain; charset="UTF-8"

Thanks for the feedback, I'll send a follow up with appropriate tags
and reviews.
