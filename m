Received: from esa.hc5016-32.iphmx.com (esa.hc5016-32.iphmx.com [207.54.87.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BB8344DB9;
	Mon, 10 Aug 2026 08:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.54.87.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786350322; cv=none; b=R/7LZeCzqaao4U9bX3lsWJ4nSaeF0h+NCSMLQgp3ixdprB0S10fLtSypjq96ei5xuF72tDnKcmsk9znWmgebMKZDlFhghBlP9vPiHg7p+ERsqNmShwjQUXwn4rdWn95145jvNzaDGO83jFKCtuRJuWUDgttRPQolZ2FIOoRyEk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786350322; c=relaxed/simple;
	bh=Yu5VxAVkhi+tZguNspFOoK3JZTsOeV34cWVexmGBL7Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ekKIRyAYI4RTrfkofU9+OsbZ5LVK6cZ1ZzBvtGVDwuUqFgszN57onKJir4z8//mPI1oj+FOKpT7p7HwesRD+v4PFC1HoBPj/TwFpFfdETHycR8JFVh26z+2B/cCAbXbEQUdCDYaTgnaIq1Hf7HGQGiIczyeSyfVWEOiW73HyVSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=harman.com; spf=pass smtp.mailfrom=harman.com; dkim=pass (2048-bit key) header.d=harman.com header.i=@harman.com header.b=H3jZQ7sj; arc=none smtp.client-ip=207.54.87.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=harman.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=harman.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=harman.com header.i=@harman.com header.b="H3jZQ7sj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=harman.com; i=@harman.com; q=dns/txt; s=CES-HARMAN1;
  t=1786350321; x=1817886321;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Yu5VxAVkhi+tZguNspFOoK3JZTsOeV34cWVexmGBL7Q=;
  b=H3jZQ7sjz3QaYPdeimC4dzNsUMpPFQF9yrYUY08bMaQYxZl8H/k/Q6rr
   I3XLY4icnjaObom/JWrUuaEqX/WdJhq8Gv6DOXNXYJK98Ye97oj14r1C1
   QMWbw+UkF+zgdzlFvdqRlhAmIUSr9dT91n8KhY9WIiHk+7M2qhQvGFxr+
   WA6Mnq4yNuMx8ZZTlIunI3Eq2TUwKRkHP++cjI5lIkoUW463To4Qj5xqh
   3illTkf7kavmPPLLhPExuDdW8LUsK22wL92igxX7oEZ4lG4XjlcPhOM03
   Ieyoba0z/kFjA/TY9gC7frHPxiVKMaDfZjDX5DZX7iKc8+H56cmTVt3PW
   w==;
X-CSE-ConnectionGUID: 6sEr5umrRsmVskcWB38PkQ==
X-CSE-MsgGUID: pcYR6+OgRVyQSGLu87dQpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="120643922"
X-IronPort-AV: E=Sophos;i="6.25,215,1779163200"; 
   d="scan'208";a="120643922"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO INMDWSHYB09.ad.harman.com) ([199.27.113.4])
  by esa7.hc5016-32.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 04:24:10 -0400
Received: from INMDWSHYB10.ad.harman.com (10.92.6.249) by
 INMDWSHYB09.ad.harman.com (10.92.6.246) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 10 Aug 2026 13:54:07 +0530
Received: from awsmblx423bs002.localdomain (10.63.34.68) by
 INMDWSHYB10.ad.harman.com (10.92.6.254) with Microsoft SMTP Server id
 15.2.2562.43 via Frontend Transport; Mon, 10 Aug 2026 13:54:07 +0530
Received: by awsmblx423bs002.localdomain (Postfix, from userid 530975)
	id 1ECF87D26A; Mon, 10 Aug 2026 08:24:07 +0000 (UTC)
From: Akshay Gujar <Akshay.Gujar@harman.com>
To: <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
	<naveen.v@harman.com>, <oneukum@suse.com>, <stern@rowland.harvard.edu>
Subject: Re: [PATCH v6 0/3] driver core: add enumeration failure uevent helper
Date: Mon, 10 Aug 2026 08:24:07 +0000
Message-ID: <20260810082407.314198-1-Akshay.Gujar@harman.com>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20260802233108.70950-1-Akshay.Gujar@harman.com>
References: <20260802233108.70950-1-Akshay.Gujar@harman.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Hi Greg,

Gentle ping on this patch series. Please let me know if any further changes are needed.

Thanks,
Akshay
