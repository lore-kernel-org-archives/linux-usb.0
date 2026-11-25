Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795620283;
	b=LOjimh751Y90/wRKjRW1mmfjWHl+0E8obCV8cp1pmDQpEz3x0bhdOritMGHNO2cZMwBI
	 vBR24DHgECuqamQtGs9d7J8vLvAPU9sdR1vtiB24/32VRoO6J1GkesuAa6nIkGxCOfAsf
	 4gthFkXNZhY23xtqL71mW7fMnJtghXBVC3RA9rNnJy/0NtRCdJzBSK9O8f+3xTlnfSHhH
	 JR7k2xeYCbVdZ2bA5+EOuySbaie9OtXp3K9RlHRTFYaGKrKi4vNSi+0iDFO12obxXQ348
	 SFSqlCI/gUrIEzLNhnvb8QhpOk+zlF5myrAyLPL3khXywPdNjfdAO+8mVisGLe4bZrQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795620283;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=BWI0oTPS6UWP+KHreqzTyFzt/bLKfNI1fMUEgGA2TjQ=;
	b=fboNuWAqC3xYr94VYUCQQX4mFEYPAdgTjuO9m+yvSP4IBEAg/11Ih3C0pp61mjNzgdFP
	 o1run6RKJV/ioSZBo0e6tiAewLUlmsc81AuoBpdGxolmA9HMLC4B1NnI7N5zyznaBNeCI
	 TVtEK8okb5kwnpE+uB+PjYoeG//FKcI53+BCNRUL5HXv/hcPjo6CdSyin7l8UPfiUkbxs
	 m2sprKzc+fAHzehdUYUidSn5CnXKLlM7yvdn1xLvRRLCpf729tV0tp06cFCz5v/MM7YAD
	 sYDbakyIxHdQUtxtwrmLjjPega5z/sqtNTeAah0Y6S+AV7HksDiPnLXriQXmAUa6uRA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="OpB6FU//";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cJM3cew1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7346D606A326
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 15:24:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7346D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OpB6FU//;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cJM3cew1
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APEMIQv175384
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 15:24:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BWI0oTPS6UWP+KHreqzTyFzt/bLKfNI1fMUEgGA2TjQ=; b=OpB6FU//8xOqb7OS
	5fVG54KpU7ZjNVKjctadQgIBzM1pOMtfT+p8RLJQKyYAAI7DZyJ5qt+UOaP/9pq4
	u8sBWRPln3bzRSPYJOuCVV7hYFjGloUQUfoatqf+FTAUdrFoUXI8IRA4nJgD5hO1
	itivGuWNLrBgEQ4KnYHzi73YpEIkNS2hpwNeAhy7ZKl8SxdU6IFb+LEhb4BFL6GZ
	DmcN5Y+58aqVqcFdGV9uBwFeAW+ByxC0qjFbCfgk8N4RUZhVJhAGLOUIiB4jt5Kz
	fAq9A5IwNKwk2eFTo41CSn49JtybruJZBKPkwkWdyxqWMvEUDUxgC06m1qXnG5Yg
	jtr1nw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vv2sfp4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 15:24:42 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1cdfb337eso3477808a12.0
        for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 07:24:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795620281; cv=none;
        d=google.com; s=arc-20260327;
        b=Ogbk7TxZ9ruNPx0i6zKNC77nNYc5tRNBQJZ65wTNrlxiifFR3OYdWKd96IGTmJEXnX
         /2ACcXrFUPCmw9wHMu9U4tfRgfR8Kc7TOeb+EbtiJefakYl+QWtj5HJ4bc98eWOX5MpB
         Y6v7otMphyvEciD8XDhDfZlMSKxYFNe1UH0sDG8MWnzye6hJSBWnQxK8FdkLNOk9Bjck
         /t3LLxELbGhC87UiCl3ja8qv7SfFpt5gBnlqkDwpBXbO2p4EJSI7Dbm0/P11PL+PZTUi
         JLYSWVvhNTS815AvlfZ1XRmCyu8BEyDPftDjljN7V6PHPbGxnbXKaGY5bmEr3VLtI9zK
         ntEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BWI0oTPS6UWP+KHreqzTyFzt/bLKfNI1fMUEgGA2TjQ=;
        fh=vXDfFTgDmqBOof/PYjI+djM9Wg8fLETO81NI/c56E4c=;
        b=C6NZArSby/mDfiq4EPAnP/3II1UGJ07ajoBV9tB/dUhf8ZVjoxNa1yrh73YRme8Mig
         5Qln7zfpU17HfTmYcCjPLdzSTD67BmEBlzEQ91JG49m0WWClH0aghkwzcnge/Le5dmuU
         sMlMPAvHHnbskXvG+1lsXmVegUtJ7wG0ooRq+bWbXETZ9NVjATRA+rwaBrbxVhHGRCAU
         sEsbeJlA8E/tQhGMnb245h0ORsMVyIW5Bo1IsW4e+F46nsPL2eYYW7pMH4uIH8A9215i
         B+R0nDplhjpEoXQOL/4t4D+qSdTJ4NX9R90JyhJ+h4HwwsRVMGusT7Ui4B1t/dT7LAvU
         ZCEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795620281; x=1796225081; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BWI0oTPS6UWP+KHreqzTyFzt/bLKfNI1fMUEgGA2TjQ=;
        b=cJM3cew1hkvYIyL1ViCsj3kK76klrSGicdUUgE9mOCNL1W6o5ORm0MgbmkkbZ++ky/
         2vUkNgT84tLjE6cV8KtUcoRzbEb4AngRs2uu2ze3e9psU18rHrty8zOfx2nTRki6hsLi
         ntrpPDqvdLM4Wo8v4CGdX4tcetEwGUIhKyej55Krwtwr4kzuKa6iIn6MVOxmio/d6kwT
         5b4N2UeS1wwaV3RF6Zb0f+T2aTYGrOhSSvPL+aVi08R7KJALyVVCmJEa0Ui6lQZvUKQM
         ArdimzhQYaG2Y4q3n+7rcEbhRmBce9JUP/ag7s9govOUlGhur1nxeuCr65eOi75ajjRT
         pU5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795620281; x=1796225081;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BWI0oTPS6UWP+KHreqzTyFzt/bLKfNI1fMUEgGA2TjQ=;
        b=0yt3m6HYgyBcxeKJwCreFvUwunKwNaAu+XrvKHPa0V4qWG8wTRs/9x3+SHP23BNBMV
         ItLJxUDzfCuVpxYiUMopmt7xUXGNvF56i1PlxXMBfL6afWI+/Nx+Bmg3xe2nL/p8MT6O
         66NpRD69SS1epIEO7zDFJWnlcHwUDi+7pHkBQ7pebnxkFlF025bfCuFYqgKoC2n+dN1t
         4ZZ56KEL+M165j5aCZ7Brmhch5zJpphd6lcGzfZxyVE6Ox/p9GEAQSxeBDeIHLmsttni
         cT6zI6NCgQ+6lTu0hVDqC95ATIS5rCev5/1hzH2rUM3Fr7x22BOag9VwvH+M4Vm1u7zH
         toWw==
X-Forwarded-Encrypted: i=1; AL+hErHouV4uJZ2kHuzxaJUR+bve65JMW4ZdKvzyWWyosgxMW0rBAGjxzeCde2EKCrDYlZRm8+dc6c7AF0c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+f4K9v9vgQorwDZFeVje3fB5zyfr9TvHG62hU/O8BMu7qaoK2T
	XL0IfYu+gcAnvtBj5IjhuxO1Mtx5p3kbmhFxsL0cC6r8Q9Yq244MGM3muj6iCb/jnfmzMqXeWbV
	plQ6PC6aWOBqCmYdiGe9p22ieXe1MQJ7CUnV6B5enaIrmmYb27n11ZFNYI4vr+RDyCv6gh4vrRv
	OupjfnEniGjRHhIGthl8zd2ejB+acqdt7xzD/I8A==
X-Gm-Gg: AZFdTZfl/M4hlERpPxfPfsgQ1nhJ34xSZVpP/k2PDSg29DIumg5BCunuaCFAiMwolxT
	sYeUCZ/EPy/8OGYyifogtrl4gSVJQDCl3nsok2i3Swg6M0KYr/uPC9FIxpeailhc5/KuGGiMzDo
	6oNrvUFf6JLp4+s2mqb6TRBh7RaSZaH5cmP9iHHKii4tnJucrJIVJQktwFHQ==
X-Received: by 2002:a17:90b:2ecb:b0:3ac:8446:c1a5 with SMTP id 98e67ed59e1d1-3b41c988620mr15762954a91.48.1795620281097;
        Wed, 25 Nov 2026 07:24:41 -0800 (PST)
X-Received: by 2002:a17:90b:2ecb:b0:3ac:8446:c1a5 with SMTP id
 98e67ed59e1d1-3b41c988620mr15762922a91.48.1795620280668; Wed, 25 Nov 2026
 07:24:40 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125-halliday-dts-v3-0-5c8311c0b70b@gmail.com> <20261125-halliday-dts-v3-2-5c8311c0b70b@gmail.com>
In-Reply-To: <20261125-halliday-dts-v3-2-5c8311c0b70b@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 16:24:29 +0100
X-Gm-Features: Aa3M54pQyww1I_PbdCBse1VupHYmzcQQ8jGP2HKCbG8YvURb7jcXXUW3MJhTLAI
Message-ID: <CAPx+jO9aHqEwVu3j5CdVTsfrhk8cMRawA5rj51EA7AdVtn-U+A@mail.gmail.com>
Subject: Re: [PATCH v3 02/14] dt-bindings: power: qcom,rpmpd: document the
 Halliday RPMh Power Domains
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Bart Van Assche <bvanassche@acm.org>, Bean Huo <beanhuo@micron.com>,
        Stanley Jhu <stanleyjhu@google.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-usb@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA2MSBTYWx0ZWRfX+lNXosTZxzSh
 k2Q3C1OmjQ+R9zesIuWWaOe3IJNPaulZiAoobOpzHJWYY/CynmeCtJLZIcuAQWn6FO79nSCCc32
 bifj3EuwU+yx/Ycd39mlslHBbVCtodc=
X-Proofpoint-GUID: LEHIBr7Fxe9-vx8GZU6q3VjP6YYjXjxi
X-Proofpoint-ORIG-GUID: LEHIBr7Fxe9-vx8GZU6q3VjP6YYjXjxi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA2MSBTYWx0ZWRfXwJMmHabvUhJx
 oAHB5yietbG01O63Etadns/dji+RBWG7AtzXicYWbYpIIcRs3IQ5JcZD6plvEcMghqWRgRSWD2b
 DpwCgiXX/khz3F2ZNJSOo8TuoBQXr520iGWxTkRtf7HQmoxG+VZODREOKBRwEEqU+eZrwsxKTni
 RR/ssjFW97dwaxKlaFgvnRGrZfJlsbCah4zcuJXeIaJYffy+JaHbcZ/eOKmSUQWCcirpTH7CMyT
 /gLIvq4ooQ1achqxLMWnueR7eb9odc0of2/9K4vNGfL/vUQx1vIiaGllc59Jlax16MTHIUhgIly
 UZLi7FM5biQvK1TBkraSsMsluBsYdA1DOMdqbuCDE9HXvqUGqsPRLbkvwDNsijKIfY04S+i4aw8
 oxQQ/XJAZch/wqlnBNEd2z7Lp9slVCceRAloY+3H/cHRZmtOGSi+Mp5tJiwiqPF4vxeJcWfeHCX
 12hSwbuDViV3mkCmhyQ==
X-Authority-Analysis: v=2.4 cv=A/z5rKWG c=1 sm=1 tr=0 ts=6b06fdba cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=yRSEYQ9GznzmN70rNvQA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250061

On Wed, Nov 25, 2026 at 4:44=E2=80=AFAM Stanislav Aleksandrov
<lightofmysoul@gmail.com> wrote:
>
> Document the RPMh Power Domains on the Qualcomm Halliday SoC
> (SXR2250P). Its command DB has the same power domains as SM8450
> (CX, EBI, GFX, LCX, LMX, MMCX, MSS, MX and MXC), so use
> qcom,sm8450-rpmhpd as the fallback compatible.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>

Applied for next (available at the immutable dt branch as well), thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Do=
cumentation/devicetree/bindings/power/qcom,rpmpd.yaml
> index 8ee1c25a7c9d..663baae9cc64 100644
> --- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> +++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> @@ -82,6 +82,10 @@ properties:
>            - enum:
>                - qcom,maili-rpmhpd
>            - const: qcom,hawi-rpmhpd
> +      - items:
> +          - enum:
> +              - qcom,halliday-rpmhpd
> +          - const: qcom,sm8450-rpmhpd
>
>    '#power-domain-cells':
>      const: 1
>
> --
> 2.55.0
>
