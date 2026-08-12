Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18A93B83FE;
	Wed, 12 Aug 2026 20:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786568179; cv=none; b=XOiDHc0/4zwedwsuRSC/7wjkczRbwFAUtYAsKaZKZwLAr2Tfq4syjnQNEKr440JDXgUhmZI9IvgGs6QbAbc0tAu6iIbF2WN9g4Hy/XhLOwIzaTghcaHl6EC69j8CGZhiBOIpJlyIcnf60GtwVqLYIVVkKOaex7zz+TXLwKJl3cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786568179; c=relaxed/simple;
	bh=9NcX/NVogdaLy2IVNQG0PyQllCUOhb7xBZI0qwAk2YI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nl8BF83HkseegaXt2s7XuOAsEdgjfFQlJPhSh1l35UNW82Ob43ehxbH/4EHDvtopirp8mWgONR8gZW9XG65bf0z5Sy8z/jiCrs2MO/Cz/1+nyXI4nbBeQMQT8gyd3hzspnwdDJIiqDpVNnKrNde3NadepBQ7wa6AAbKQ52HH72o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QyKnDG2N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QyKnDG2N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 477CD1F000E9;
	Wed, 12 Aug 2026 20:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786568157;
	bh=Ix1Cta+r0oOtdi0u98TpB9atom8h2rOa+KMtFOK0yl4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QyKnDG2N7g9Mud139yHP7wgtpp4DItMDDnx5Zi0B7RW9WYGGFYzs4dv8d9S8O0MMM
	 bxtD9FpZXB44FvYy9E6eZvqhgqF3Ih7gfCjG/i8uQVs8hBvQthXPbtU4S+8EaxyDsL
	 aPQUkLYTTSUxYcXqyC8ax2IFHUrk/ZYYX+B91I0yeexBRxdHRmbLbUICAcPc23yrEL
	 yjqwg0Tt++KGdUDo3VQA0JYXcSKxQy4VSuxeLu/RYUyzIZLCbV320tfkO+w/9grhZg
	 mVNuqaqsZLscatgaZidy0STCPLA6bMvKFUJDUtNniBl3rIxYlgSgtXKqpoav5CD1Y/
	 6WOsMz1V08oig==
Date: Wed, 12 Aug 2026 15:55:56 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Amber Kao <amber.kao@ite.com.tw>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Doreen Lin <doreen.lin@ite.com.tw>, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Eric Su <Eric.Su@ite.com.tw>,
	Bling Chiang <Bling.Chiang@ite.com.tw>,
	Yaode Fang <Yaode.Fang@ite.com.tw>,
	Jeson Yang <jeson.yang@ite.com.tw>, devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v7 1/2] dt-bindings: usb: Add ITE IT8851/IT8853 Type-C PD
 controllers
Message-ID: <178656815573.972346.7934495537153840446.robh@kernel.org>
References: <20260807-ucsi-itepd-v7-0-998ac11ed0ef@ite.com.tw>
 <20260807-ucsi-itepd-v7-1-998ac11ed0ef@ite.com.tw>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807-ucsi-itepd-v7-1-998ac11ed0ef@ite.com.tw>


On Fri, 07 Aug 2026 18:17:45 +0800, Amber Kao wrote:
> Add device tree binding for the ITE IT8851 and IT8853 I2C-based USB
> Type-C Power Delivery controllers.
> The IT8851 supports one Type-C port; the IT8853 is the two-port variant
> sharing the same interface.
> 
> Add a MAINTAINERS entry for the binding.
> 
> Cc: Yaode Fang <Yaode.Fang@ite.com.tw>
> Cc: Jeson Yang <jeson.yang@ite.com.tw>
> Cc: Bling Chiang <Bling.Chiang@ite.com.tw>
> Cc: Eric Su <Eric.Su@ite.com.tw>
> Cc: Doreen Lin <doreen.lin@ite.com.tw>
> Signed-off-by: Amber Kao <amber.kao@ite.com.tw>
> ---
>  .../devicetree/bindings/usb/ite,it8851.yaml        | 156 +++++++++++++++++++++
>  MAINTAINERS                                        |   8 ++
>  2 files changed, 164 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

