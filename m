Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2912E889C;
	Sun,  2 Aug 2026 06:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785653319; cv=none; b=b+Nv+hvSjytjyju9mksKnm6XW2QNkX84C+BuLfUjK80rLvXJRSv8g9P9gAieH9osz0WxXr1lIcrKlp4Zq4VX9O/DpyhJ3vrDX/NbCWJbt1Du71ozTYUR2XEr9hssfKj280KDUX1K5XzR2vQcC8dcDPsVITFE0TcFv9WMRSjEje0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785653319; c=relaxed/simple;
	bh=4cfG16S+rkmW0i+Xq/EyZBv5k87Qgr2X+nXb6qv1EEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MAiaHX/9xqr9qJ7NBJPKgWxj2LxgAEFHmvxMcxxm17jwiuahZjjJTVO0X/wbbeBiwIb91Z+c3T7/eSZhZ9Dn8cyl3zIM+RfaMqlaAp6fqYQTdDzg1u+oYAdYJgs9av8e5tWVuiNr7aOOqexx1emuQdPzcO5ZzLHSeKw4j4co9CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=HApSNoKo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="HApSNoKo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 582EF1F00AC4;
	Sun,  2 Aug 2026 06:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785653317;
	bh=4cfG16S+rkmW0i+Xq/EyZBv5k87Qgr2X+nXb6qv1EEM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HApSNoKoih7e1bPRA3aMu7+927ZAxVQEfmOYNwoAWRdHm6O41MRtiJg9NWQ+WArCS
	 jVq+Oi0Y4Gg13HjaBJtSjDsYlArkWlC1CyfdN89m6CGR8dFR1WQm/fxLGAC2wMltZf
	 4gY5NVHa4U5zhla/gH6D7jqDG4jsTUkrRggaTKPU=
Date: Sun, 2 Aug 2026 08:47:10 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: lurenjia534@outlook.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	syzbot+7b70c4a6021fd49c4151@syzkaller.appspotmail.com,
	Felipe Balbi <balbi@ti.com>,
	Andrzej Pietrasiewicz <andrzej.p@samsung.com>
Subject: Re: [PATCH] usb: gadget: f_hid: reject zero report length
Message-ID: <2026080227-prude-wrist-ec7c@gregkh>
References: <20260802-hid-report-length-usb-testing-v1-1-0499f99136d2@outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260802-hid-report-length-usb-testing-v1-1-0499f99136d2@outlook.com>

On Sun, Aug 02, 2026 at 04:19:34AM +0800, lurenjia534 via B4 Relay wrote:
> From: lurenjia534 <lurenjia534@outlook.com>

We need a real name, not an email alias.

thanks,

greg k-h
