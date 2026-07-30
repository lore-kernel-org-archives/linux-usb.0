Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C923CF69E;
	Thu, 30 Jul 2026 22:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785449500; cv=none; b=RuNcb1kf7ztWlg71zQI7BCpeYYxOsBFolNEhaJqzIC+pIT/V0ZzniagvqZVHaSH2GmamUCPO2Tp0OmjfMaE5o0DpmdZm5sKyPnB2orD8C0TvD8i6fFpwyBgu2PWXDVmqbnaN7duVcGQsGk9bNUXE4SFQOyjMVKPdmdbzziFTzVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785449500; c=relaxed/simple;
	bh=rvad7WK/sY6Hf/5D/RgBjV04A22yG/qnPT/sAD4jHds=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CqmPPgYBCPiHnvkO1w8Oc5TKBBqjNrjBwEpldGl54bSAOK/XZvHQoMONHUQXxrqTLvz6Bhxvvshh7ThkX/0Tvq6NyToGF2kXjgyPFAztHxj5ZTSmgS4A3AN5jmMZyiUfDgfKzyMVdumplpVWm4sEQDo/nOZicD6wKT3KOnd20tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Vm6Ts2Sw; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Vm6Ts2Sw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=mo9fPrlE1DDIO/u3U4uDa1Sx+BmGg9X8JWC3vGlrzQM=; b=Vm6Ts2SwebiQUqkW3zr9UM2E5D
	4vmcQuPmx9G/aevUF86JsrS2ANtOQa+FDDEKSB2mJBr8z0iVwcZOtxmffjE77gMuL3aZlEYWjArqJ
	qTn0JPuJvc8wGbVEI4BHIli3d1PkKRqohKQiOI5MsXlHgV9/wMGjdJ7gWltYy9Ig08KM9RLxB1rd5
	7dFm5NHowDi3hV42nutLAOSek2H0r51itPW8enGHZlsF8gUXQ4fhLH+wUyAaCw3kepu+3mDfxyb1c
	8HuWIx2NIeUw5P8f6G6ZRKx78hpN7EM6Wc9q3cLzD6iWy8EUwn0nG0AwYTd5EAsHVbkFcVQHNnaJP
	5qecZsDA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpYyT-0000000BPyY-26A5;
	Thu, 30 Jul 2026 22:11:33 +0000
Message-ID: <a9dd53b3-0666-404a-99e0-76617ae3f944@infradead.org>
Date: Thu, 30 Jul 2026 15:11:32 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Jul 30 (usb/dwc3/)
To: Mark Brown <broonie@kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org,
 Elson Serrao <elson.serrao@oss.qualcomm.com>
References: <amtnlbQl2KLongvo@sirena.org.uk>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <amtnlbQl2KLongvo@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/30/26 8:02 AM, Mark Brown wrote:
> Hi all,
> 
> Changes since 20260729:
> 

on x86_64:
when # CONFIG_POWER_SUPPLY is not set

ERROR: modpost: "power_supply_unreg_notifier" [drivers/usb/dwc3/dwc3.ko] undefined!
ERROR: modpost: "power_supply_reg_notifier" [drivers/usb/dwc3/dwc3.ko] undefined!


-- 
~Randy

