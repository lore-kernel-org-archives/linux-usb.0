Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186325;
	b=IB4lVfl0i7mD2QfG66pf57nGDwFTpVPKVdk2RbWk9zkp9H3F3rl7+b2GmzNxVMGSFEdT
	 LpBuwjGnIADzjWG+cHy4GWJBT4PlRwoUsbV9Yt2qdeAT7Zdz13W/CzjoYcjtQoW6es9iF
	 9iLkVbby1hMn6LpCZzkY3+Jwggkqn873YON3+bgqXDcPWugr7xQYMTfWVdQXtabAuOiTS
	 ZBfpmriO2v93mqGNDzVQqVKqTr/y74swg2PbPJZ0JhCYsO3d3u2ujjABax23C7mAkXeCF
	 8aCnCRa9cDU5XNsCtp2Q8Rf7VbTFZ+fhzx+rhwQA96aDZ5HD0Umixeto//AgZ2fNXJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186325;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=+Id3A592Xb/IiJVthWkUHQXHmOtFk/UBW7fwiCuEDNc=;
	b=uDWEVDriywOA5MybtE9Tld/jG0newXKAyHWtWjBc+vtP92w3vvwLi3alZ5nX8dJrA7bs
	 8jIeYWT27ouVjJI9UasonbcIKPamhyUHnizqaXNEnLWF/OQBD3bOQR+kp0K88OeLGw03+
	 8bfM7KuGxNNRgbsNUl2OOqrosd037ROpkbiY6AIzVfKzaxi4UxzhAbFnNySrwTlvlz3s7
	 HoNswYiBpxnj/NTVmvneNJnDVkeWlm8MdhTzMQH+sXemfROzhTtVcyvhEvFZobaQBzHvM
	 QLeK11aNZ/mmtpajqUnsIpoQNKeN+b4pZd1jOgEsHZTtA9PdMsZZ1k+HI04z4OWYJZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lRwUfy10;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9A9606A320;
	Fri, 20 Nov 2026 14:52:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C9A9606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lRwUfy10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795186325; x=1826722325;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8510aG4pYvsuaCc1nyiXfTTm+g3e52/ym/Ri+rPNUc4=;
  b=lRwUfy10+jqhhoCcSCYisZeo/CuLb3hVj3J8gsFPfIq4zJo/Udh2P96/
   8yJYJ8Tdq07CdaHJUbXoBLSMoU5PAbChfWz5dtPqFdrk1beWvHzk3gWf2
   EqHG/CxecynakJjMICBjv10ZgxaWbgrdY2JznIWVpWLNljDHG8nIH19VU
   bCUbG8658GopFjszi+RQnTtvrBcD+5Nd30QvXGyAEpKhT1YvGqZyhOJ4m
   u+0kfbZEBQq6F2q5/YOmS0j/XyMkMgIKZ7y/M1y/3a+R1e6WFeMd+j3pZ
   8gAvdH9LEsdKCyRhbSsZFI6lO43muQ8CxqPTx4218/UBV6sSLwNsRqUJH
   Q==;
X-CSE-ConnectionGUID: iG/XLoBdTN+jrc+5X9OwrA==
X-CSE-MsgGUID: B2EFlim3QcyN17YVmDmkEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4093731"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4093731"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 06:52:02 -0800
X-CSE-ConnectionGUID: Iiew3iipS9mXSMeACcsANQ==
X-CSE-MsgGUID: a86fUU8wQ9ydOCfpr+ey0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="10928765"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 20 Nov 2026 06:51:59 -0800
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id EF34A99; Fri, 20 Nov 2026 15:51:57 +0100 (CET)
Date: Fri, 20 Nov 2026 15:51:57 +0100
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Akash Kumar <akash.kumar@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Wayne Chang <waynec@nvidia.com>,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] usb: typec: ucsi_ccg: Add CC orientation sensing
 via GPIO
Message-ID: <awBejZc8L1z7lcgi@black.igk.intel.com>
References: <20261117-ucsi-ccg-cc-orientation-v2-0-2e3576a11eb7@qti.qualcomm.com>
 <20261117-ucsi-ccg-cc-orientation-v2-2-2e3576a11eb7@qti.qualcomm.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117-ucsi-ccg-cc-orientation-v2-2-2e3576a11eb7@qti.qualcomm.com>

Hi,

> +static void ucsi_ccg_connector_status(struct ucsi_connector *con)
> +{
> +	struct ucsi_ccg *uc = ucsi_get_drvdata(con->ucsi);
> +	int orientation;
> +
> +	if (!UCSI_CONSTAT(con, CONNECTED)) {
> +		typec_set_orientation(con->port, TYPEC_ORIENTATION_NONE);
> +		return;
> +	}
> +
> +	if (con->num > CCG_MAX_PORTS || !uc->orientation_gpio[con->num - 1])
> +		return;
> +
> +	orientation = gpiod_get_value_cansleep(uc->orientation_gpio[con->num - 1]);
> +	if (orientation >= 0)
> +		typec_set_orientation(con->port,
> +				       orientation ? TYPEC_ORIENTATION_REVERSE :
> +						     TYPEC_ORIENTATION_NORMAL);
> +}

Looks like you have a small allignment issue here.

Maybe it would be more clear to return if the orientation is < 0.

	orientation = gpiod_get_value_cansleep(uc->orientation_gpio[con->num - 1]);
	if (orientation < 0)
                return;

	typec_set_orientation(con->port, orientation ? TYPEC_ORIENTATION_REVERSE :
                                                       TYPEC_ORIENTATION_NORMAL);

Thanks,

-- 
heikki
