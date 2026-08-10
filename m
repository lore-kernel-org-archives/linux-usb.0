Received: from esa.hc5016-32.iphmx.com (esa.hc5016-32.iphmx.com [207.54.81.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB683630BF;
	Mon, 10 Aug 2026 08:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.54.81.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786350199; cv=none; b=Re09z/6sDxW9xwsyH34H1x5y0uxAU4qTANgb8bsddBoFdg4E/CU/NOhU6iO9OJpb9B6xcrVftAdiicu5q21YPRqcfW+YcAA90bjuqSQ3cspDoo1qrwVxNMJYnZkGztmgkFp84xQMjdprUsWqklaAVbyzJIZJZMhfGJm8RtdJJwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786350199; c=relaxed/simple;
	bh=Yu5VxAVkhi+tZguNspFOoK3JZTsOeV34cWVexmGBL7Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N8R5rdkqK1vgCLCChsE6PPuvUr8eo9eTu5QhDQZv05HH62rtb98+/GeXl3XCEprE5OTVdjXARrePhXNrOyoDb7sm+GSJnXSWkB3T9WmsWI1qTPGvuU+kFpXezoYatqB2600AdGcrfEixtR2EWSjis5jhfVbT2ZbjEqcXxKsEKtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=harman.com; spf=pass smtp.mailfrom=harman.com; dkim=pass (2048-bit key) header.d=harman.com header.i=@harman.com header.b=EphwWVOK; arc=none smtp.client-ip=207.54.81.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=harman.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=harman.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=harman.com header.i=@harman.com header.b="EphwWVOK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=harman.com; i=@harman.com; q=dns/txt; s=CES-HARMAN1;
  t=1786350197; x=1817886197;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Yu5VxAVkhi+tZguNspFOoK3JZTsOeV34cWVexmGBL7Q=;
  b=EphwWVOKjbou5VozA2j09eg5fdwzzYWvUeTsPTocbXKqIJsCnEdGPEJk
   U+Zt6yOTuF86SuKSXJ9MZC3U5+N46ZYbD0UX29MoeBChb176Z70BKghf4
   LVHNsToT/KhqfX7n/N2SM+yZ8uE0c0n915X6pRaWYVMRLqdkkjOwVejdI
   avyBIzTkQeArOedt/p8bKefWHYAjbSo0VrAZpbnVnWrFj7KVghvJZx0ku
   pmuKpM60Az9ft2F1h2ysmt5FpgEaJOiOjXObu63VHjkSC6Yj+1yOOlEoH
   KihY+aPexC3AkKkiQMkXBqceBswQ5zSmLO0YWYgU0ZMYw3reSa7aUQWua
   Q==;
X-CSE-ConnectionGUID: KZWlT2tgRxuzc4Lfrnn4dw==
X-CSE-MsgGUID: KvVvkTjIQKyBSNtVJXsq9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="120215693"
X-IronPort-AV: E=Sophos;i="6.25,215,1779163200"; 
   d="scan'208";a="120215693"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO INMDWSHYB10.ad.harman.com) ([199.27.113.4])
  by esa4.hc5016-32.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 04:23:15 -0400
Received: from INMDWSHYB10.ad.harman.com (10.92.6.249) by
 INMDWSHYB10.ad.harman.com (10.92.6.249) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 10 Aug 2026 13:53:13 +0530
Received: from awsmblx423bs002.localdomain (10.63.34.68) by
 INMDWSHYB10.ad.harman.com (10.92.6.254) with Microsoft SMTP Server id
 15.2.2562.43 via Frontend Transport; Mon, 10 Aug 2026 13:53:13 +0530
Received: by awsmblx423bs002.localdomain (Postfix, from userid 530975)
	id 32C7A7D26A; Mon, 10 Aug 2026 08:23:13 +0000 (UTC)
From: Akshay Gujar <Akshay.Gujar@harman.com>
To: <akshay.gujar@harman.com>
CC: <gregkh@linuxfoundation.org>, <linux-kernel@vger.kernel.org>,
	<linux-usb@vger.kernel.org>, <naveen.v@harman.com>, <oneukum@suse.com>,
	<stern@rowland.harvard.edu>
Subject: Re: [PATCH v6 0/3] driver core: add enumeration failure uevent helper
Date: Mon, 10 Aug 2026 08:23:13 +0000
Message-ID: <20260810082313.313776-1-Akshay.Gujar@harman.com>
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
