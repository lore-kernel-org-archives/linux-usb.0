Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21F53EA97A
	for <linux-usb@vger.kernel.org>; Fri, 26 Jun 2026 09:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782465670; cv=none; b=LdRMl845OE/TSXjaiKJwUa3JM4EVpae8/FmUUq4/IRV3R0/fwJFMPr8G6svDlZkuDCbLYtQK22CHvTwpSnJYrQrDH2vccl1tABZseAvoX+DhmJPBEJ/BBEiTUozUG9ImirJHprFuufy3WtyT8qKHmxT3MaUu80qBgb/XBJWxFDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782465670; c=relaxed/simple;
	bh=WRq3jfDCaHWwvIe/3HUL9T+D7iJ5f7F8GrxArSuqNT0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NWKN4Ddmu4+ioCwF/cFMbqKY5hNOXh5xX/FCx8HCywnmuSZcQcug+Qs9xJLzFFc0kWTJL9xBJqay7E0uno/yOulgWdiO7y0prEId0wURlKyMt466ggOKtnP09nJqX7pz49HvLpyGVzzKpDfoBWX/YI2qnEKFbxMd29iOve68NNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IYY3V3ls; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IYY3V3ls"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782465668; x=1814001668;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WRq3jfDCaHWwvIe/3HUL9T+D7iJ5f7F8GrxArSuqNT0=;
  b=IYY3V3lsEwF9wbDLOulQUmyeFwz/ukN/OXtZjXvNWeKZ2bLUH/kMWBwz
   XLZjdOf57jUlqnu3ds8HNFQuvnmNY1/qq5pngwtv1D23bs/Xy7mEugm0V
   mK3ViBgMGJLyo416jMPcb+KKcpQjXd9E8KNND4fJW5ZknQCzvhgjExXil
   QaXXUcQvzdDKvM4rvVCGbLre7WxDz8IpZlkxB2XNxY1Foe7JiM2LhY1MR
   VH4uZxgA6uCbCYXs0CmYiEhImuAg5n/UPG68HswCNOuuy7N02sMmwg2pO
   45P5mFnM8JEklOBme6VRiiSRwfl7PemC+12KoS85ow/LmNANRqN1B0sOg
   g==;
X-CSE-ConnectionGUID: dftMrBs5Q6u4RBvJuWvC4Q==
X-CSE-MsgGUID: lWiExLQkRVWVni9pWW10NA==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="93915446"
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; 
   d="scan'208";a="93915446"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2026 02:21:07 -0700
X-CSE-ConnectionGUID: V/ap/NveQi6AUwPAg7qUvA==
X-CSE-MsgGUID: egRIS6+CRSeTNTqsEujjeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; 
   d="scan'208";a="244889237"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa009.fm.intel.com with ESMTP; 26 Jun 2026 02:21:06 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id C79DF98; Fri, 26 Jun 2026 11:21:04 +0200 (CEST)
Date: Fri, 26 Jun 2026 11:21:04 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: USB4/Thunderbolt maintenance on vacation 29.6.2026 - 24.7.2026
Message-ID: <20260626092104.GO3066@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Dear all,

After long and dark winter the summer is finally here, and it means only
one thing - vacation :-) I will be out for next four weeks without access
to email. If there are patches in the meantime I will pick them up when I'm
back.

I wish everyone nice and relaxing summer!
