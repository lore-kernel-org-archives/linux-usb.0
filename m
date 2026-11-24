Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795530220;
	b=HJcoQgZJrZCasD8JlJYzWcFRIUuWItOrOx6jEnwJXW4feCLLZRKrcVN91lXqFZuMuhre
	 9Li6n9rvQpEfZ8sAy5Fq6Owd/KvB1eMbwE1LWVe81JvibjmrXiWiogOiuVz3R74CpZD8K
	 6rzlukHf2i5UMX6exQo8dxnXQ9GG3X7mUoDcO0iBS47glq0zEULyq+5mgwvbFMe+loUZE
	 TUwyCqa4jRoTZwzmg5pGRULBS9/EsPaw7NUebSfaXJuTBikO4enIyiIpRs8xnH+r08U6y
	 BclklXWJMi7GCKwS407p2wb/T0X7IecoJaP1tKMldfU53Fb0niMb0DcVq+jO3LccvEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530220;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=nKFAQ/eQi2+pKN1nmF1ojcPhRlz5R78v/XFET3w6CA4=;
	b=v973sjNy6cSP13Kz2WC0yJnZTWT0kFvGCrwPE8xJTdEo1SYePvHNrSqsLnFbufuwE69G
	 0WuxBSo06RjRYJ6Hs53E2nDfhR+v2HJL0TEELCoLQtTGODJlemPZYkR0y5KT0AQRfsc7g
	 xOjPrHkHuMyMPmiHPtiWBZcXlhkKCjRqC0EW2rPKj4xq5oXT51d8Rci72Fa+4ayvARFtE
	 fa4EXXpMz47ctiv/EiZhKDfR7DiE7sqAOZGBg71FuUaqEhuCLd4feuPAfNzRlCY3nG6QC
	 acFfo1pTND5OBjyfxZXnBBJqQhL7SO44eFXqsX+MC1gX4OSDupfsAHP3AkkfBx9KLWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=1vZMMFUR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3830C606A31E;
	Tue, 24 Nov 2026 14:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=1vZMMFUR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CD041F000D1;
	Tue, 24 Nov 2026 14:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795530219;
	bh=nKFAQ/eQi2+pKN1nmF1ojcPhRlz5R78v/XFET3w6CA4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=1vZMMFURAQstEAN6/qM0Pgk2S/TZOWOPkhpVXU0kKW1xIE8Ue4kWLmiRAJhgtRT0N
	 sOT7euao3S+uLTaQGhgYnKeo8zhdHNUHM59RhT6D+CZZgCt3vIzC2AACBLvpT5l04Q
	 TEOtMl2ZXhVsQwgLepaW9OJExmWGpEj2lxpnaCKo=
Date: Tue, 24 Nov 2026 15:24:00 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: Re: [PATCH v8 2/5] include: linux: phy: Add phy attribute "type" and
 associated helpers
Message-ID: <2026112445-draw-enzyme-628e@gregkh>
References: <20260913-eusb2-interrupt-v8-v8-0-0f505b9c394b@oss.qualcomm.com>
 <20260913-eusb2-interrupt-v8-v8-2-0f505b9c394b@oss.qualcomm.com>
 <9fa428e0-f685-410c-bcdd-319fd427d2cc@app.fastmail.com>
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
In-Reply-To: <9fa428e0-f685-410c-bcdd-319fd427d2cc@app.fastmail.com>

On Tue, Nov 24, 2026 at 10:18:06AM +0100, Arnd Bergmann wrote:
> On Sun, Sep 13, 2026, at 16:40, Krishna Kurapati wrote:
> 
> > diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
> > index ea47975e288a..038c2b58bbe1 100644
> > --- a/include/linux/phy/phy.h
> > +++ b/include/linux/phy/phy.h
> > @@ -21,6 +21,8 @@
> >  #include <linux/phy/phy-lvds.h>
> >  #include <linux/phy/phy-mipi-dphy.h>
> > 
> > +#include <dt-bindings/phy/phy.h>
> > +
> >  struct phy;
> 
> This broke the build in linux-next because there are now two conflicting
> definitions of PHY_TYPE_PCIE visible in drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c:
> 
> In file included from include/linux/phy/phy.h:25,
>                  from drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c:15:
> include/dt-bindings/phy/phy.h:15:33: error: expected identifier before numeric constant
>    15 | #define PHY_TYPE_PCIE           2
>       |                                 ^
> drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c:47:9: note: in expansion of macro 'PHY_TYPE_PCIE'
>    47 |         PHY_TYPE_PCIE = 1,
>       |         ^~~~~~~~~~~~~
> 
> We probably just need to rename the enum values in phy-qcom-uniphy-pcie-28lp.c.

Already fixed in my tree, should be showing up on next linux-next.

thanks,

greg k-h
