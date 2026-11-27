Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795778631;
	b=SlOC0voA5xBVCvF6mx8cAegrZLFAE9KwwEsM/0IiQRhrb8LtFWAEMWi6FwtnxEFh7n/g
	 aXtBEmHOKBrLOXm5CL4aXXQajoW7Klxz9L07V1pmR/pMLuQcMoUe6pAgXKFW078uLDmYd
	 KnMAGahfShpzKwCW7pipdPawvtt8vQrlq1+aKDuUbiYl+mEazKoIgbiiKazAxeZ4RlGF+
	 R+k9ZgDXYau4uPERU6SVWSENSxj3kfULgfw29F96b/KWt25AimHSOg48LscdTvXQXlWsi
	 S7s+lz9Oau9Tp9t1OBN48RCCpUkQ7AP2YxBNcKjYVSavmm4QF7rvGgOojTGz0vsuuzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795778631;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=mK5RhtnnNWXMlCTquZ9NQFJvoEWITHzyteXLzq6fXPM=;
	b=f13+hMZLWaB8J9dNRBgvKldM2vvkJe82AEvF4S8SniyEw8NruIX+5iMBTSFJh808S8T2
	 bRC7X2lp1aExGBbF0n34E1teuc1OA2Ki6WyDwGak/zIFs3YHQcsy0wKqsjUTvitzidvxk
	 pBl3B4VnzuXivOyWt1TBnKPmVwnFz6t6KHarz0NKL1NzNL4RHdUJ1rEQct8ILFhvnSd/n
	 IpRU1BDiQyuMNIldVxiOELi59xaGh/dcKBD/sNiACwQ0r12hvqQUQbVgXL8vNrdELeegK
	 bL7hG70j//ud47L3cRUQ745eipwa0S1+9eA6DX3D8kgRa7xd7wlNeoomK1zS+NAdMKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W+U5vf3Q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315F0606A31E;
	Fri, 27 Nov 2026 11:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W+U5vf3Q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D0331F0089F;
	Fri, 27 Nov 2026 11:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795778629;
	bh=mK5RhtnnNWXMlCTquZ9NQFJvoEWITHzyteXLzq6fXPM=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=W+U5vf3Qzp36jc0/5Aov1uzc4wuKic+K0qqBbW7kF7vSMOdhoVZtKSjb7d0n5PSYc
	 8b4dchosUJExuyylsCUY3YM0kwojmL8sGdWuouYObx49XLUHj4L8YvRFB+ci4BtTrj
	 dWpzYQgk5OcY1wwUfBoS3QTJp7KJ7iN3yfnYYB2/r2KQ6RCQ9GpXn2vv/7PyOS/zSi
	 jJSBVQWXF4uX71m9WRhaFKeDlICgfraUAuI/lqE99mAjp92Xv+4k85CFrCQLxe7Efd
	 hbAigLfW6LqMNAfwqpKjUOMPRBaN533voPFNNnJn57ZZpY1hFss7Z+sC6bDGVxGwuT
	 9+hIphD2dO1NA==
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 0/3] phy: qcom: carry live SS-link state without
 growing enum phy_mode
From: Manivannan Sadhasivam <mani@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Tapas Rana <tapas.rana@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Abel Vesa <abelvesa@kernel.org>, 
 Wesley Cheng <wesley.cheng@oss.qualcomm.com>, 
 Esteban Urrutia <esteuwu@proton.me>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>, 
 Ronak Raheja <ronak.raheja@oss.qualcomm.com>, 
 Faisal Hassan <faisal.hassan@oss.qualcomm.com>, 
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
 prashanth.k@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <23b5c705-cd55-4c0c-9c95-c61afb286416@oss.qualcomm.com>
References: <20261106082716.128968-1-tapas.rana@oss.qualcomm.com>
 <23b5c705-cd55-4c0c-9c95-c61afb286416@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 16:53:39 +0530
Message-Id: <179577861920.3421.4340993862938053001.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=742; i=mani@kernel.org;
 h=from:subject:message-id; bh=DNaiOmAIsM3RjZZ86nfFogAtVyk1ZOvfNvmFkm/aqf8=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBrCWg+Wjg+B/qLCJCqKXlBRo9OqyZhTZKnMSEwK
 yHRUc8xjnGJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCawloPgAKCRBVnxHm/pHO
 9eJtCACQWXnzV18kNd1oaSofDwCYBTC8k3efRtOM1oFjre1l0Oo4QWqHQo/bnYQgpd6/CNdUl4B
 rTzEs6mmT1zxkvCnl/dDUIDhqIn78dsEJJtsCoVu/W79FeCPyb3aNAJfK5lfOS+Kldi5B0pJ5tm
 2FaS5yfOfGzkn9Hj23LlCCFZRArEA1RJUgkR7DSnKkbE+X83E5/BsJGOLPY8A+loFfGxp6yA2Mn
 bdfqNfKI+upVS7SSdOc+5TlCH9HeDq8VPLgtUakWX0OgNP23IHi98oH7vO9TcQm5qyZNbjSERIm
 Wv42K8UjdyJZCujtrcJCz1W2yFo5F9FMsCEJtpgUS7y/twrT
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-11-06 16:06 +0100, Konrad Dybcio wrote:
> On 11/6/26 9:27 AM, Tapas Rana wrote:
> > QMP PHY drivers always enable receiver detection (ARCVR_DTCT_EN) in
> > autonomous mode, and additionally enable LFPS detection (ALFPS_DTCT_EN)
> > when a SuperSpeed link is present; otherwise they fall back to
> > receiver-detect event selection (ARCVR_DTCT_EVENT_SEL). This choice is
> > made by comparing phy_mode against
> > PHY_MODE_USB_HOST_SS/PHY_MODE_USB_DEVICE_SS. However, dwc3 core only
> > calls phy_set_mode()/phy_set_mode_ext() with the base
> > PHY_MODE_USB_HOST or PHY_MODE_USB_DEVICE, never the _SS/_HS/_FS/_LS
> > submodes. 
> 
> Without much more insight, this sounds like the place to fix it then
> 

+1

- Mani


