Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735A83B0ADD;
	Mon, 23 Mar 2026 14:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774276718; cv=none; b=MG4A5e9C/YZBLKcNmawD90/118fVJtYzs0SziIPLOmtWT0IIUJ5sWxhhlUD0+mDam8V4O1werVqZ+ZCI4rMBq5/mm44Xz7sjOiRr1fjKPY+IaNdZd6ToUvTC798+KQ1IwayUn6knxECwv8b8h9m6Bg4/P+ngmif+mKE9oDSjmC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774276718; c=relaxed/simple;
	bh=Q8yzU7oBURNt+wPrt3Zq4LJWGjFX0fYGgtlJz51VqXo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=byNhQIqny34mv6HPdRtgSDUzM7IIeZE3HDo1vSkC4DdQuQ9hyvG6NcFU1qURCOGYk6XW4fEYsdNl/06thI0ZBCrQgmzW5wSwGc6MqiI6Y/moPi5ImLSqS6S8Y6B3iV6gYG6NOql96SmONXU9NZ6wC3NLNdO8/ttmv4fCLU10cko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j1I5Wngw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j1I5Wngw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B118C4CEF7;
	Mon, 23 Mar 2026 14:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774276718;
	bh=Q8yzU7oBURNt+wPrt3Zq4LJWGjFX0fYGgtlJz51VqXo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j1I5Wngwn8apZSY1Lz8LrrTMQPpHh3SPu3wGlDgRxZYJ2jvLx8Obo8WwGbgyuZK4J
	 wuGu6Wg5TCpoED71Hd9FL5Z0d0HDPEQPo2qcguoConcx82CBOy7waysmrIJ2+ChCQ6
	 EAB1gNRDWHrbth0hx8PZygiw5b+cf6xC3PQ6m5udlXXGHoPl9bSWB+vLqj50gxKMLm
	 S8r5ivkW9bTom8IfLXZN/HYkcXIYrWzlVoZEqdMmfik/hwnucUQysGa/iriP8QfteF
	 NRInwF2zGX1fg4zMt5XIyS3ENtq8n6PtswUlDUkD/7h5y3uqTsDxy/eipfhUkDwtNj
	 qbLIcXWavGJMQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v7 0/2] arm64: dts: qcom: glymur: Add USB support
Date: Mon, 23 Mar 2026 09:38:21 -0500
Message-ID: <177427670535.11515.11926100924280298245.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260320-dts-qcom-glymur-add-usb-support-v7-0-ba367eda6010@oss.qualcomm.com>
References: <20260320-dts-qcom-glymur-add-usb-support-v7-0-ba367eda6010@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 20 Mar 2026 12:56:51 +0200, Abel Vesa wrote:
> Add support for USB on Glymur SoC and its Compute Reference Device.
> 
> This unblocks the upstreaming of the display support, since 3 DP instances
> rely on some clocks provided by the combo PHYs.
> 
> 

Applied, thanks!

[1/2] arm64: dts: qcom: glymur: Add USB related nodes
      commit: 83f88b7dda2c71fd5ff0b0b44b47e20a51270ae4
[2/2] arm64: dts: qcom: glymur-crd: Enable USB support
      commit: fd556a59e0e928a368cda25810b2de0e6cdc8e7e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
