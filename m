Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51B7479883
	for <linux-usb@vger.kernel.org>; Sun, 18 Oct 2026 11:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792324594; cv=none; b=YRyMWQ/l+IpjmVSXXTtWWzzwI6yUOxM+nJ5UWuCrv7CFbshyyPo8oXTz39NItpc5TbDC4nr15gDCs6QVhOsG40k0GvvaofRBDqUAzebn4i3bRjRZ5sgvl53VMuMbbJIBdGdSf5QxmXoBqaYJ9Augwl1fhKbjap6yHrILClAmcWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792324594; c=relaxed/simple;
	bh=ap+80GaPDnXI09SxjszHeawrEkEUnedSIl8LSpSpaRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PLTne+FFvFK7Naa9HCyhpIfSvtJV8DxrkTWNTIeiMKqNvZGvGtEtzq3Sv2B063C0BoSTj+ArsQVD2EGWD71o9ItYfH5ggvHo3tcTOSmT863K+jOBYZjAcQ26bq8kRK2eyOSdn2EJy4RcFUef9aLohUTkJQJ3C+y2kizf1KaqB6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QvQ9Afmz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bIYmpMR7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QvQ9Afmz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bIYmpMR7"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69I5tgRL2286830
	for <linux-usb@vger.kernel.org>; Sun, 18 Oct 2026 11:56:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gcEYZe12IS5R8fbm0oKp4F5/
	idlukA88I/0oldtDxJQ=; b=QvQ9Afmzj/fGG+aeASrcA/JAaYzYGKk6IFlJtbUL
	W5uH3JiBvrYtBFZykDTHD+Tt8jKX4GWEdGsUD0D/CNPcV42pZYoskpnfq8yAn2TJ
	JXZqU5JFzIO7YLkjVbnQ29AjMQkbTeMKVfeGXEPu2rpZDRdhAl5uLx6qU0X/Qxg2
	D6gB8QsP3SURJ9+VxKET818hKXYkd3wIoLVBDMXRbjBGDdPQrFH+ZLYwJUC8r3W4
	yLU/HfKASohkj9S3ANaovwgwu8urHvo1FRMMb1sg4Gdb6QvubeYSQ226KPx3hdR+
	CDGjnlupNYD6znJGGMCNc3Nq9nHEt3gedBst9cjCh/7Sdw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc2a9junw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sun, 18 Oct 2026 11:56:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb71b1443so285699085a.2
        for <linux-usb@vger.kernel.org>; Sun, 18 Oct 2026 04:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792324592; x=1792929392; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gcEYZe12IS5R8fbm0oKp4F5/idlukA88I/0oldtDxJQ=;
        b=bIYmpMR7eSOK1TWKlF4snWvPeV2X9sgKMkfxhZvBL1mZy+NTUzGBB/VfVZhe2nb1sC
         gmmy+oHY21eV9JaBGgLcG+pB5Ah6q3Z/r+phl65oje5zIAoNrDjNDGYoSHlmKWaRVBj3
         MMQjl8pXHHhafPjE4OIaDBvR27osDZ4txyWhyGAWMROLJbvDUxvt7soeR7lYZ/zSm/32
         QcQecs5G9Df5wD1+opWNW+RK1uIE6MbiD0fClAs4sPZj0K+KOeBi9/csciAq9C962+L7
         CyBHncaPnBslpgyp3Cak6Tc5NkynaThSAwvubrKfJfB2ZfdheWjNlId8+7JZlLrhtjeY
         BybA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792324592; x=1792929392;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gcEYZe12IS5R8fbm0oKp4F5/idlukA88I/0oldtDxJQ=;
        b=OqL1jOYYDBRGkmrMjaiS0NV4bg0/xePDG9mr3qDXEcOxnnVub/leXj7VtsMsspaXe+
         QbrJGvjNmjZm5ZMy4XYqnjprvpPoKUmQx4GZVBL045I+lT/wDQoqFSz2zOns3mJIBQnC
         PRAxsM3gW58eJk4l+WPkrWUGu64lhxQI6+YaV2ncfFwPTZBLN/yU4x/7zEVBj/mlFviQ
         Eg7060igSIAA95TQf6vWK/OCygRjw97iD/fgzB0Anzu9REpYEbrMZ8JeRgceJ/xtJtci
         PyILfAad3URJEH0IcE/necNAxDjytl1bBGuv45fJG8o6fIMml0RUTlhv/BYMijJe7hcD
         4rug==
X-Forwarded-Encrypted: i=1; AKwUvBy7uTIpMqXtE6Gs2/Q4xtgXX25O1qC2bJeRm9GSPiTehI8C3Lv/AQ+2CbFkix1UukIitUi5jHaW7Mk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJf2dcrh4gFOviR3suy+YeoH/Zk7aaQrB39im3yd9PgloRhzfL2
	NooxOlYz7awUMtRrIMTCw0FSoOmp5Um1l9hA/8O79BdYDiROPlzbI3YsVN0l5vD88r6+qfKkcFZ
	qeq3jyjGzJBuwOnOdwq8QD4oKCBtmwv0VOAwAbkncn54LkmfjMQ52NUyBu6d7ILC06AjzGUU=
X-Gm-Gg: AYBFou0s1QIKFswC/toDW5RC6h/YCgrqGNmLZ9xvfYNsWqZtnEAD0UytoQjnFMmhcHe
	1Nti+fp0eARhmbAwk3f9k+bVrmz7yBJeRTBzIwLeP29q9nSqD0e6hb3oEigMnBqCN60xwGKp1dc
	0ZrWUdl1hqe6MXReJMpM/3Zkqm6b9nLg+ZhxUO7L1LkFzrCUgUDwF5sXGCD8lZqPc9pWHLv/T3u
	+TP5OlFTJPKbejjkghzapb2wNKipotx4hzRJ+pG7vySJj3dVUTN9R9en8EmXApf/TD4b5+b6NQN
	jRA3lu7zzO4AgeQTZpTGmWuuB2ps+CNM20f+xWZexK6YxtVr2QBCHvr3QHdeRjPYrowUbFIxO0J
	faFGy5OrD4qjX/foRU1YDMbJTWFBBBnbmkzstOO//sbhUZGQsWUsU1Q3yw2a1Jh4YCa0f5mR9KT
	0+164mfuaVPVe3
X-Received: by 2002:a05:620a:2314:10b0:93f:31bb:e3c with SMTP id af79cd13be357-93f31bb153bmr332141785a.68.1792324591804;
        Sun, 18 Oct 2026 04:56:31 -0700 (PDT)
X-Received: by 2002:a05:620a:2314:10b0:93f:31bb:e3c with SMTP id af79cd13be357-93f31bb153bmr332139985a.68.1792324591331;
        Sun, 18 Oct 2026 04:56:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a63cd1esm1370126e87.72.2026.10.18.04.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 04:56:29 -0700 (PDT)
Date: Sun, 18 Oct 2026 14:56:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, kernel@collabora.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: Use DP AltMode defines
Message-ID: <46mtzsydckbt6ca66h3stj7sn37ittzarhc6nqbjp3fitaqx3x@i7b7vbpxsui6>
References: <20261017-dp-altmode-dt-defines-v2-0-7ab3d93553dd@collabora.com>
 <20261017-dp-altmode-dt-defines-v2-4-7ab3d93553dd@collabora.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261017-dp-altmode-dt-defines-v2-4-7ab3d93553dd@collabora.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE4MDA0NyBTYWx0ZWRfX7BLkx5wh1Jjv
 GEa0Fz5IryraM+bj3O7IPa+CnLKHdKhaWZojVkLfBfo3HxBy4wvjOa0J2rV6BT4mqCoztUwSX14
 yLBqzsCQBk+sujwqxgzzbHeaRCHwr/U=
X-Proofpoint-GUID: o3iE8c6VkFSix1GyDgZADpHWhfJbr0rB
X-Proofpoint-ORIG-GUID: o3iE8c6VkFSix1GyDgZADpHWhfJbr0rB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE4MDA0NyBTYWx0ZWRfX1q4U0e/dV+2a
 qos/gmMCnpXK+DIPl27JJtcxFt0hWRYJ93FutWvZ71UacWxupCWVLqWSxMr7VSNZ1Xr3Lenjgir
 k974jO76WN3ejwpIXfC/XebGpnmDUrMTgeb8oPyIQCsRuiZaCaXCuaxAunINaElIIwLpvhTvUpY
 8NxevVysh1+VTed3CWhd8jsnxiMQjZzafqJmMysK1u0KptQFDjOhOLhFVTfCeicQZN1XzxEXukV
 T6UKu9hcfJ5PFWWySMYy86e14kbLQqK/u6OwwiyVOuEZeQ8HWDM0vhDub9imQ4QgtlcyMsErmvF
 1wvZP27MDGF5+I63GBuLT1assOPK5BPC4yiwqihMNIKq5F1LY7fLu9np2G5KT7eit1djn9LjnIk
 WQiYuIVUKlPoocVPD8bgUw/tchNmEeGHEWIsis5/jR5cmiIvcX7Q8xtzA1MTMX//baGiM9uQnZp
 9ka/Xv4uEgAcu+fw14Q==
X-Authority-Analysis: v=2.4 cv=PMeaavqC c=1 sm=1 tr=0 ts=6ad4b3f0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=QX4gbG5DAAAA:8
 a=EUspDBNiAAAA:8 a=imkpALUroobUoGdfvlcA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-18_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610180047

On Sat, Oct 17, 2026 at 09:59:33PM +0200, Sebastian Reichel wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> Use the new USB-C DP AltMode defines for the SVID and the capabilities
> VDO to make the DTs more readable.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 8 ++++++--
>  arch/arm64/boot/dts/qcom/sm8150-hdk.dts  | 9 +++++++--
>  2 files changed, 13 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
