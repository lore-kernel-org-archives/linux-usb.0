Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795495389;
	b=wzuzs1Ljp3U5gawpyijBnsjK8K+9MXRvS8HL6M40GgNTDfwN4+WtwyCoYOxNx7UfGJkf
	 MloJW1xSFjKRlSBNR7xEbtNHc9yMo+KGGDLvYrxeKkrik8cucf47Gr+Qpw7U12C16FMke
	 lnAsRsHSVU301oUkoQ7IeeKTPSFTUjxn7GBPR6xFTbH46oCdxmbi9gZpmiA8ZTPe+yxRa
	 ax9wJ9TlCEEtEvppxqzA8QW0Lf2DCwBAGAYPtFiDc/vwrr/MN8JJKOU8puzibahfJIyEE
	 kH1Tj3F7yZwtv8JDR+zGmckDqu7rqnze0xxUywWX45En3iKPHCXk0AgyVg1txvwBVQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795495389;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=alVf3IXoLmI+UC0QNZ3eyfxOCP0Xpb/aangUYUO/CGk=;
	b=roy2jzOt7x/HPrc2I73l9J74VeAJkwWIzYrAPffb0FoQfbFS1c7X0hjczgFgCcFgyJzS
	 iWCiSIVuvfHMhfzRF4FCrj0yjFZ7j8sqapMYGZQmq3jTy4eG4y235UA/d5COJSjexLtn5
	 ISXBM7qzhuY9dNQhtkVQ8Cza2YP8kAhy96v73E6MNVWg2wcknpCw5+y7EaWo228Lsrex/
	 MXUBdGCALmmp4L6JNlHRpbpQpPCvbZ+S2KLBlOCxNLuRdiiXHGByuFQd+7sEtklnndrl6
	 Ag8wTjMIqsv96kL61h6KSzb6d9X3vAItQNcY9T+oOg7XGlD1WNEML/p507kWSiG8O9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=jW7uxaif;
	arc=none smtp.remote-ip=111.22.67.135
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31A24606A327;
	Tue, 24 Nov 2026 04:43:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31A24606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=jW7uxaif
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=jW7uxaifzyw+0oi+/+hM0QQRjOK4oQDkWXMie/Ln7zzB1qaEnPY5hwm++1vziWVIOQWP7SihRfJ4e
	 Zq0AcTu5Wqyf9P6vpiG8uc6hA8zFbzwPmMi1T4M6Rxx21dl++4ouyTa+l/zLuTCoehh5Gvgwp3lMSX
	 0A+D4TNDGmITRVTY=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee76b0515d3981-44b92;
	Tue, 24 Nov 2026 12:43:05 +0800 (CST)
X-RM-TRANSID:2ee76b0515d3981-44b92
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from DESKTOP-3K8GUTQ (unknown[223.108.79.98])
	by rmsmtp-syy-appsvr02-12002 (RichMail) with SMTP id 2ee26b0515d7833-13a15;
	Tue, 24 Nov 2026 12:43:05 +0800 (CST)
X-RM-TRANSID:2ee26b0515d7833-13a15
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>,
	heikki.krogerus@linux.intel.com,
	bryan.odonoghue@linaro.org,
	david@ixit.cz,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: tcpm: qcom: Release connector fwnode after VBUS lookup
Date: Tue, 24 Nov 2026 12:43:03 +0800
Message-ID: <20261124024000.1851-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <2026112052-unmapped-etching-4bca@gregkh>
References: <2026112052-unmapped-etching-4bca@gregkh>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, Nov 20, 2026 at 09:17:07AM +0100, Greg Kroah-Hartman wrote:
> I picked up an earlier version of this:
> 	https://lore.kernel.org/r/20261025-typec-of-fix-v1-1-06bfc16a7846@ixit.cz

Understood, thank you for the pointer.

I checked David's patch: it releases the connector fwnode right after
the devm_of_regulator_get_optional() lookup in the same probe function,
targeting the same leak and the same Fixes: 506927b6bf29 as my version.
It fully covers the issue, so please consider my submission from Nov 12

  https://lore.kernel.org/all/20261112021836.1851-1-laixiangwu@cmss.chinamobile.com/

withdrawn in favour of David's patch. No action needed on it.

Thanks,
Xiangwu Lai


