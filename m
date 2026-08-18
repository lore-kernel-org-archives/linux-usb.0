Received: from esa.hc5016-32.iphmx.com (esa.hc5016-32.iphmx.com [207.54.87.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5557C3E4510;
	Tue, 18 Aug 2026 06:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.54.87.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787033519; cv=none; b=eH9lOGW/aJhW2V5Hs13sUcoO9FMprUlnJ/gOUXtIeWbOLZ2x60qq87sWIMkx2KguZURzY54MKgWe9J8qgPX6o5ok5wwE1Wq68gtIPiCQ1ld0h7imJBWJbLYY5uHGOfcdfGYZLTPRt0gUTL9FQUwz9qq6k9kyT9vmCTVNplJlZNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787033519; c=relaxed/simple;
	bh=LTH6ytpf0jBYn1KAlDR+6BeBDbylBylh5NgvPX13L9Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ikpBVne7P/sj0D/OkEvBiVbpX0xSsgue0RvwwpBfSX6Xd7hi80GY/r2VElcGiEgTQiyXQAsfXv7kE0924Lr1K7TYR/WROlNdNBBnj93apfp13wf9d82PKMShVg/V8Iz+uOV0BM6hjYAuXWjDOS2oj0M83aGN3ZM9o44dd2VK9KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=harman.com; spf=pass smtp.mailfrom=harman.com; dkim=pass (2048-bit key) header.d=harman.com header.i=@harman.com header.b=BF+P/c8S; arc=none smtp.client-ip=207.54.87.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=harman.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=harman.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=harman.com header.i=@harman.com header.b="BF+P/c8S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=harman.com; i=@harman.com; q=dns/txt; s=CES-HARMAN1;
  t=1787033521; x=1818569521;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LTH6ytpf0jBYn1KAlDR+6BeBDbylBylh5NgvPX13L9Y=;
  b=BF+P/c8SLN5GZX3CGrAJ6xLrHKNfv7sOP9c1IphN42WaZWvkSLFTrUSk
   E315A8WnfC8EuPZFYm7P0mRAAm8VzSpZBZbBnuUTcp8FkRkWpH5pxyNua
   eU6kxhWOotY+m5MMlLr9pqcpWXrJLwrMqvdK8qPDyU1wrZLFH7xEP3kVj
   q0sjZxN9KZ4CmRudXTaH3WZVGboNzxM3WlcttCP2C+oAIiYBSf2viH7iU
   YDbxiTSLDTP/ZSj7X9Sa0wXcoRGD3ZJEDshGZmCn4+km7cFsCSnNoWL2T
   W9lyvIoIWNxXQ9pk+YwAPVk2B+B9O/4axMr4zgElI2KFVW4BjhRDW3Xjx
   A==;
X-CSE-ConnectionGUID: MHVh7a42TgSmMDZ1s9t7/Q==
X-CSE-MsgGUID: aIIq7+DDQeyiaNOwdS03cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="121785078"
X-IronPort-AV: E=Sophos;i="6.25,230,1779163200"; 
   d="scan'208";a="121785078"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO INMDWSHYB10.ad.harman.com) ([199.27.113.4])
  by esa10.hc5016-32.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 02:10:52 -0400
Received: from INMDWSHYB09.ad.harman.com (10.92.6.246) by
 INMDWSHYB10.ad.harman.com (10.92.6.249) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 18 Aug 2026 11:40:46 +0530
Received: from awsmblx423bs002.localdomain (10.63.34.68) by
 INMDWSHYB09.ad.harman.com (10.92.6.254) with Microsoft SMTP Server id
 15.2.2562.43 via Frontend Transport; Tue, 18 Aug 2026 11:40:46 +0530
Received: by awsmblx423bs002.localdomain (Postfix, from userid 530975)
	id 61E8B7D21C; Tue, 18 Aug 2026 06:10:46 +0000 (UTC)
From: Akshay Gujar <Akshay.Gujar@harman.com>
To: <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
	<naveen.v@harman.com>, <oneukum@suse.com>, <stern@rowland.harvard.edu>
Subject: Re: [PATCH v6 0/3] driver core: add enumeration failure uevent helper
Date: Tue, 18 Aug 2026 06:10:46 +0000
Message-ID: <20260818061046.14961-1-Akshay.Gujar@harman.com>
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

Second ping on this patch series. Please let me know if there are any concerns or further changes needed.

Thanks,
Akshay
