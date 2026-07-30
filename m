Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch [79.135.106.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0693750CF;
	Thu, 30 Jul 2026 16:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785429545; cv=none; b=AgiPv5olH3Mn6LLoRgHgflIpyk1uoD61MfESQzSLEYNifqGtZrTRaV1KuobF3qtQTtWB3GfPwhuk6vRIiZMdoeblevyvJX3R2zDtouEKv67dDTfTeZHgKoAubJeH7N7tpAdyn1yiFfijR1zQbd49sDI3odVYRxZbhF9JrszO7mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785429545; c=relaxed/simple;
	bh=FvSRXzH21BOJOktta5GQtFHb1pGMF2T86f5HtQBYDl8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fYGFsaSFwWP9c/B9pBlLlON6hHtJBC70rJk8FvJ9LvbcVn70vausEpGwdZdptRjXxSUuLxpI6AxccFd3X6IjB0kMB6Qkrpa/2bNDKoNKLs+4TE1RIu165AiIEZzyI/qf/3AJzEhEfd+W82DJ7/bLYa+cp9XTrnL4GUja8i/35p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=fE+70jUT; arc=none smtp.client-ip=79.135.106.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="fE+70jUT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1785429539; x=1785688739;
	bh=FvSRXzH21BOJOktta5GQtFHb1pGMF2T86f5HtQBYDl8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=fE+70jUTpsYhVkVyacxBQcq4J+DvncCG9+8vI1lR0rnR1IV1GD2WZ6IGbBO6BFRYW
	 2K/ozJ9KhdTcKiroK+xft8F+3Xu+GDqFmduzZqvzTfNVUxC2pZKiq0gqMQqch8W0Ky
	 O/nXCvfOflqLGaxiuov5GASHo+LLsjXhpnjCf4WEX3xYzqfGgA8bvu65f03CSF7cyo
	 OaAvRuS8WDfWDjooblZvVQnoa2d1L2gKkl/rcJh5QLr4hkA9xAjtMXC/Vq8soCGTLW
	 dm9+xVt6tu34geUSneF9Ll2y60fjXBFr0mzLw3FhuF/FBdkdz6bDKh7KNTuOq94ozD
	 xz1/5dNsoBXiA==
Date: Thu, 30 Jul 2026 16:38:52 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>
From: Esteban Urrutia <esteuwu@proton.me>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: soc: qcom: qcom,pmic-glink: Add compatible string for SM8475
Message-ID: <4dcdfd25-edec-4ea9-8b80-2472e2b66e5e@proton.me>
In-Reply-To: <20260730-resourceful-scrupulous-goshawk-c9ea53@quoll>
References: <20260729-sm8475-pmic-glink-v1-0-c2e1967c04de@proton.me> <20260729-sm8475-pmic-glink-v1-1-c2e1967c04de@proton.me> <20260730-resourceful-scrupulous-goshawk-c9ea53@quoll>
Feedback-ID: 147889766:user:proton
X-Pm-Message-ID: 18bca195c0b4ada2204842aecab4aed0bf173d9a
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 7/30/26 5:03 AM, Krzysztof Kozlowski wrote:
> First, not true. You did not add compatible for pmic-glink.
>=20
> Second, that's redundant. You just repeated subject and the diff
> (although incorrectly). Explain why this is not compatible with existing
> variants, writing bindings EXPLICITLY ask for that.

Thanks for the heads up. Will fix it.

Regards,
Esteban

